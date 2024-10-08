
#!/bin/bash -v
errorFound="FALSE"
hPercent="0.95" # written as a decimal
wPercent="1" # written as a decimal
declare -a winIgnore=("Desktop" "has no name" "BDHF" "mutter guard window")

getWindows() {
    ### The below Loop generates a list of all windwos. Cleans the output of that list, and loops through it to generate the winList array.
    # checks to see if any windows are match the width % output.
    # Creates the main Associative Array where multiple index'd arrays will be built.
    # The hope is that this will allow me to pinpoint items by building out a sort of bash/db (THIS IS ABSOLUTELY NOT THE BEST WAY TO DO SOMETHING LIKE THIS)
    declare -A winList=$(xwininfo -root -int -tree | grep -v 'Parent\|(has no name)\|child\|BDHF\|Desktop' | awk '{$1=$1};1' | tr -d '@!|":()' | sed '/^$/d' | sed 's/^/\"/g' | cut -d + -f 1 | sed 's/$/\"/g' | tr -s ' ')
    # The following arrays are declared in the order they are called in the below for loop
    declare -a winTableIndexArray=("index")
    declare -a winIdArray=("ID")
    declare -a winNameArray=("Name")
    declare -a winResWArray=("Res Width")
    declare -a winResHArray=("Res Height")
    declare -a winResMaxWArray=("Max Width Met")
    declare -a winResMaxHArray=("Max Height Met")
    declare -a winResFSArray=("Window Fullscreen")
    declare -a winHiddenState=("Window Hidden")
    declare -a winIgnoreArray=("On Ignore List")
    declare -a komorebiTriggerKill=("Kill Komorebi")
    arrayCounter="0"
    oldIFS=$IFS
    IFS=$'\n'

    echo "Generating table for all windows"
    for winSingle in $winList # syntaxing around this var is super important. Please don't change w/out good reason.
    do
        ((arrayCounter++))
        winTableIndexArray+=($(echo $arrayCounter)) >>/dev/null
        winIdArray+=($(echo $winSingle | awk '{print$1}' | tr -d \"\')) >>/dev/null
        winNameArray+=($(echo $winSingle | awk '{$1=$NF=""; print $0}' | awk '{$1=$1};1')) >>/dev/null
        winResWArray+=($(echo $winSingle | awk '{print$NF}' | tr -d \"\' | cut -d x -f 1)) >>/dev/null
        winResHArray+=($(echo $winSingle | awk '{print$NF}' | tr -d \"\' | cut -d x -f 2)) >>/dev/null
        echo "Verifying index $arrayCounter"
        if ((${winResWArray[$arrayCounter]} >= $maxResW))
        then
            echo "   - $arrayCounter has hit max size threshold for WIDTH"
            winResMaxWArray+=($(echo "TRUE")) >>/dev/null
            nothingToReport="FALSE"
        else
            winResMaxWArray+=($(echo "FALSE")) >>/dev/null
            nothingToReport="TRUE"
        fi
        if ((${winResHArray[$arrayCounter]} >= $maxResH))
        then
            echo "   - $arrayCounter has hit max size threshold for HEIGHT"
            winResMaxHArray+=($(echo "TRUE")) >>/dev/null
            nothingToReport="FALSE"
        else
            winResMaxHArray+=($(echo "FALSE")) >>/dev/null
            nothingToReport="TRUE"
        fi
        if [ "${winResMaxWArray[$arrayCounter]}" = "TRUE" ] && [ "${winResMaxHArray[$arrayCounter]}" = "TRUE" ]
        then
            echo "   - $arrayCounter is considered fullscreen"
            winResFSArray+=($(echo "TRUE"))
            nothingToReport="FALSE"
        else
            winResFSArray+=($(echo "FALSE"))
            nothingToReport="TRUE"
        fi
        if xwininfo -all -id ${winIdArray[$arrayCounter]} | grep "Hidden"
        then
            winHiddenState+=($(echo "TRUE"))
        else
            winHiddenState+=($(echo "FALSE"))
        fi
        if [[ "${winIgnore[@]}" =~ "${winNameArray[$arrayCounter]}" ]]
        then
            echo "   - $arrayCounter (${winNameArray[$arrayCounter]}) FOUND in ignore list"
            winIgnoreArray+=($(echo "TRUE"))
            nothingToReport="FALSE"
        else
            winIgnoreArray+=($(echo "FALSE"))
            nothingToReport="TRUE"
        fi
        if  [ "${winHiddenState[$arrayCounter]}" = "FALSE" ] && [ "${winResFSArray[$arrayCounter]}" = "TRUE" ] && [ "${winIgnoreArray[$arrayCounter]}" = "FALSE" ]
        then
            echo "   - $arrayCounter Criteria for Komorebi kill met"
            komorebiTriggerKill+=($(echo "TRUE"))
            nothingToReport="FALSE"
        else
            komorebiTriggerKill+=($(echo "FALSE"))
            nothingToReport="TRUE"
        fi
        if [ "${nothingToReport}" = "TRUE" ]
        then
            echo "   - $arrayCounter No Action Needed"
        fi
    done
    if [[ "${komorebiTriggerKill[@]}" =~ "TRUE" ]]
    then
        killKomorebi="TRUE"
    else
        killKomorebi="FALSE"
    fi

    IFS=$oldIFS
    for windex in ${winTableIndexArray[@]}
    do
        winTable=$(echo "$winTable\n| ${winTableIndexArray[$windex]} | ${winIdArray[$windex]} | ${winNameArray[$windex]} | ${winResWArray[$windex]} | ${winResHArray[$windex]} | ${winResMaxWArray[$windex]} | ${winResMaxHArray[$windex]} | ${winResFSArray[$windex]} | ${winHiddenState[$windex]} | ${winIgnoreArray[$windex]} | ${komorebiTriggerKill[$windex]}")
    done
    echo -e $winTable | column -t -s '|'
    ###
}

cleanUp() {
   unset winTable winTableIndexArray winIdArray winNameArray winResWArray winResHArray winResMaxWArray winResMaxHArray winResFSArray winHiddenState winIgnoreArray komorebiTriggerKill
}

killKPid() {
    if [ "${1}" = "TRUE" ]
    then
        echo "TRUE"
        komorebiPids=$(echo $komorebiPids | tr ' ' '\n' | tail -n+2)
    fi
    for kpid in ${komorebiPids}
    do
        echo "Brutal kill"
        echo $kpid
        kill $kpid
        sleep 1
        ps -ef | grep komorebi | grep -v grep | awk '{print$2}' | grep $kpid
        if [ $? = 0 ]
        then
            echo "$kpid still running. Performing force kill with -9"
            kill -9 $kpid
        fi
    done
}

# Main Loop
while [ "${errorFound}" = "FALSE" ]
do
    # gets the combined resolution of all monitors
    allMonRes=$(xwininfo -root | awk -F'[ +x]' '$3 ~ /-geometry/ {printf "%dx%d",$4/'"$(xrandr | grep ' connected ' | wc -l)"',$5}')
    # sets the Max Width of all monitors
    monResW=$(echo $allMonRes | cut -d x -f 1)
    # Sets the Max Height of all monitors
    monResH=$(echo $allMonRes | cut -d x -f 2)
    # Does math Width is 100% and Heigh is 95%. This accounts for windows where the content doesn't fill the screen like google chrome
    maxResW=$(awk -v n=$monResW 'BEGIN{print int(n*1)}')
    maxResH=$(awk -v n=$monResH 'BEGIN{print int(n*0.95)}')
    getWindows

    kpidCount=$(ps -ef | grep '/System/Applications/komorebi' | grep -v 'grep' | awk '{print$2}' | wc -l)
    komorebiPids=$(ps -ef | grep '/System/Applications/komorebi' | grep -v 'grep' | awk '{print$2}')

    if [ "${killKomorebi}" = "TRUE" ]
    then
        echo "The following services meet the criteria for Komorebi kill"
        echo -e $winTable | column -t -s '|'
        case $kpidCount in
        0) echo "Komorebi not running" ;;
        *) echo "Killing all instaces of Komorebi"
            killKPid
            zenity --notification\
            --window-icon="dialog-information" \
            --text="wpe2k has closed komorebi"
            ;;
        esac
    else
        case $kpidCount in
        0) echo "Starting Komorebi"
            /System/Applications/komorebi &
            zenity --notification\
            --window-icon="dialog-information" \
            --text="wpe2k has launched komorebi"
            ;;
        1) echo "Komorebi already running" ;;
        *) echo "More than 1 instance of Komorebi running. Killing all but 1."
            keepAlive="TRUE"
            killKPid $keepAlive
            ;;
        esac
    fi
    cleanUp
    sleep 3
done
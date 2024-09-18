
#!/bin/bash
oldIFS=$IFS
errorFound="FALSE"
hPercent="0.95" # written as a decimal
wPercent="1" # written as a decimal
maxWidth=$(xwininfo -root | grep 'Width:' | awk '{print$2}')
maxHeight=$(xwininfo -root | grep 'Height:' | awk '{print$2}')

declare -a winIgnore=("Desktop" "has no name" "BDHF" "mutter guard window")

updateIFS() {
    case $1 in
    space)
        echo "IFS converted to space"
        IFS=$' '
        ;;
    newline)
        echo "IFS converted to new line"
        IFS=$'\n'
        ;;
    restore)
        echo "IFS set to default"
        IFS=$oldIFS
        ;;
    esac
}

function getMonitors() {
    # # # # #
    # Explaining the output of the below command
    # xrandr --listactivemonitors | grep -v Monitors
    # WIDTH/Na/x/HEIGHT/Na+${distance from left}+${distance from top}
    # Examples: The below examples are with a static primary monitor but moving another monitor around in my displays menu.
    # virt monitor right side
    #   Pop $xrandr --listactivemonitors | grep -v Monitors
    #    0: +*DisplayPort-0 2560/697x1440/392+0+351  DisplayPort-0
    #    1: +HDMI-A-0 1080/598x1920/336+2560+0  HDMI-A-0
    #
    # virt monitor left side
    #   Pop $xrandr --listactivemonitors | grep -v Monitors
    #    0: +*DisplayPort-0 2560/697x1440/392+1080+265  DisplayPort-0
    #    1: +HDMI-A-0 1080/598x1920/336+0+0  HDMI-A-0
    #
    # virt monitor above
    #   Pop $xrandr --listactivemonitors | grep -v Monitors
    #    0: +*DisplayPort-0 2560/697x1440/392+0+1920  DisplayPort-0
    #    1: +HDMI-A-0 1080/598x1920/336+719+0  HDMI-A-0
    # # # # #

    # This function is to draw a map of your screens so we can plot where windows are later.
    # formula to calculate boarders will be as follows
    # WIDTH/Na/x/HEIGHT/Na+${VIRT_ORIGIN}+HORIZ_ORIGIN
    # top_left=0+0
    # top_right=max+0
    # bot_right=max+max
    # bot_left=0+max
    echo "Populating monitor arrays"
    updateIFS newline
    monCounter=0
    # establish monitor boarders within min max.
    for activeMonitors in $monList
    do
        echo "Monitor: $monCounter"
        echo $activeMonitors
        monIndexArray+=($(echo $monCounter)) >>/dev/null
        echo $activeMonitors | awk '{print$NF}' | tr -d '-'
        monNameArray+=($(echo $activeMonitors | awk '{print$NF}' | tr -d '-'))

        echo $activeMonitors | awk '{print$3}' | cut -d 'x' -f 2 | cut -d '+' -f 3
        monTopArray+=($(echo $activeMonitors | awk '{print$3}' | cut -d 'x' -f 2 | cut -d '+' -f 3))

        echo $activeMonitors | awk '{print$3}' | cut -d 'x' -f 2 | cut -d '+' -f 2
        monLeftArray+=($(echo $activeMonitors | awk '{print$3}' | cut -d 'x' -f 2 | cut -d '+' -f 2))

        monBot=$(echo $activeMonitors | awk '{print$3}' | cut -d 'x' -f 2 | cut -d '/' -f 1)
        monRight=$(echo $activeMonitors | awk '{print$3}' | cut -d 'x' -f 1 | cut -d '/' -f 1)

        # Does math Width is 100% and Heigh is 95%. This accounts for windows where the content doesn't fill the screen like google chrome
        monMaxH=$(echo $activeMonitors | awk '{print$3}'| cut -d 'x' -f 2 | cut -d / -f 1)
        monMaxWArray+=($(awk -v n=$monRight 'BEGIN{print int(n*1)}'))
        monMaxHArray+=($(awk -v n=$monMaxH 'BEGIN{print int(n*0.95)}'))

        echo $((${monTopArray[$monCounter]} + $monBot))
        monBotArray+=($((${monTopArray[$monCounter]} + $monBot)))
        echo $((${monTopArray[$monCounter]} + $monRight))
        monRightArray+=($((${monLeftArray[$monCounter]} + $monRight)))
        ((monCounter++))
    done
    echo "Printing Monitor Table"
    for mindex in ${monIndexArray[@]}
        do
        monTable=$(echo "$monTable\n| ${monIndexArray[$mindex]} | ${monNameArray[$mindex]} | ${monTopArray[$mindex]} | ${monLeftArray[$mindex]} | ${monBotArray[$mindex]} | ${monRightArray[$mindex]}")
    done
    echo -e $monTable | column -t -s '|'

    # gets the combined resolution of all monitors
    allMonRes=$(xwininfo -root | awk -F'[ +x]' '$3 ~ /-geometry/ {printf "%dx%d",$4/'"$(xrandr | grep ' connected ' | wc -l)"',$5}')
    # sets the Max Width of all monitors
    monResW=$(echo $allMonRes | cut -d x -f 1)
    # Sets the Max Height of all monitors
    monResH=$(echo $allMonRes | cut -d x -f 2)
}

function getWindows() {
    ### The below Loop generates a list of all windwos. Cleans the output of that list, and loops through it to generate the winList array.
    # checks to see if any windows are match the width % output.
    updateIFS newline
    echo "Generating table for all windows"
    winCounter=0
    winTable="| Index | ID | Name | Monitor | Width | Height | Max Width | Max Height | Fullscreen | Hidden | Ignore | Kill"
    for winSingle in $winList # syntaxing around this var is super important. Please don't change w/out good reason.
    do
        winTableIndexArray+=($(echo $winCounter)) >>/dev/null
        winIdArray+=($(echo $winSingle | awk '{print$1}' | tr -d \"\')) >>/dev/null
        winNameArray+=($(echo $winSingle | awk '{$1=$NF=""; print $0}' | awk '{$1=$1};1')) >>/dev/null
        winResWArray+=($(echo $winSingle | awk '{print$NF}' | tr -d \"\' | cut -d x -f 1)) >>/dev/null
        winResHArray+=($(echo $winSingle | awk '{print$NF}' | tr -d \"\' | cut -d x -f 2 | cut -d + -f 1)) >>/dev/null
        winTopCoordsArray+=($(echo $winSingle | awk '{print$NF}' | tr -d \"\' | cut -d '+' -f 3)) >>/dev/null
        winLeftCoordsArray+=($(echo $winSingle | awk '{print$NF}' | tr -d \"\' | cut -d '+' -f 2)) >>/dev/null
        unset winFoundOnMon
        for mindex in ${monIndexArray[@]}
        do
            echo "$winCounter # # #"
            echo "   - $winCounter: Checking monitor ${monNameArray[$mindex]}"
            echo "   - $winCounter: Wintop to Montop: ${winTopCoordsArray[$winCounter]} >= ${monTopArray[$mindex]}"
            echo "   - $winCounter: Wintop to MonBot: ${winTopCoordsArray[$winCounter]} < ${monBotArray[$mindex]}"
            echo "   - $winCounter: Winleft to MonLeft: ${winLeftCoordsArray[$winCounter]} >= ${monLeftArray[$mindex]}"
            echo "   - $winCounter: WinLeft to MonRight: ${winLeftCoordsArray[$winCounter]} < ${monRightArray[$mindex]}"
            if (( ${winTopCoordsArray[$winCounter]} >= ${monTopArray[$mindex]} )) && ((${winTopCoordsArray[$winCounter]} < ${monBotArray[$mindex]} )) && (( ${winLeftCoordsArray[$winCounter]} >= ${monLeftArray[$mindex]} )) && (( ${winLeftCoordsArray[$winCounter]} < ${monRightArray[$mindex]}))
            then
                echo "   - $winCounter: $winCounter is on monitor ${monNameArray[$mindex]}"
                winOnMonArray+=($(echo "${monNameArray[$mindex]}")) >>/dev/null
                nothingToReport="TRUE"
                winFoundOnMon="TRUE"
                echo "   - $winCounter: Max Width win/mon: ${winResWArray[$winCounter]} / ${monMaxWArray[$mindex]}"
                echo "   - $winCounter: Max Height win/mon: ${winResHArray[$winCounter]} / ${monMaxHArray[$mindex]}"
                if ((${winResWArray[$winCounter]} >= ${monMaxWArray[$mindex]}))
                then
                    echo "   - $winCounter has hit max size threshold for winCounter"
                    winResMaxWArray+=($(echo "TRUE")) >>/dev/null
                    nothingToReport="FALSE"
                else
                    winResMaxWArray+=($(echo "FALSE")) >>/dev/null
                    nothingToReport="TRUE"
                fi
                if ((${winResHArray[$winCounter]} >= ${monMaxHArray[$mindex]}))
                then
                    echo "   - $winCounter has hit max size threshold for HEIGHT"
                    winResMaxHArray+=($(echo "TRUE")) >>/dev/null
                    nothingToReport="FALSE"
                else
                    winResMaxHArray+=($(echo "FALSE")) >>/dev/null
                    nothingToReport="TRUE"
                fi
            fi
        done
        if [ "${winFoundOnMon}" != "TRUE" ]
            then
                echo "   - $winCounter: Window not on monitor - Skipping"
                ((winCounter++))
                continue
        fi
        if [ "${winResMaxWArray[$winCounter]}" = "TRUE" ] && [ "${winResMaxHArray[$winCounter]}" = "TRUE" ]
        then
            echo "   - $winCounter is considered fullscreen"
            winResFSArray+=($(echo "TRUE"))
            nothingToReport="FALSE"
        else
            winResFSArray+=($(echo "FALSE"))
            nothingToReport="TRUE"
        fi
        if xwininfo -all -id ${winIdArray[$winCounter]} | grep "Hidden"
        then
            winHiddenState+=($(echo "TRUE"))
        else
            winHiddenState+=($(echo "FALSE"))
        fi
        if [[ "${winIgnore[@]}" =~ "${winNameArray[$winCounter]}" ]]
        then
            echo "   - $winCounter (${winNameArray[$winCounter]}) FOUND in ignore list"
            winIgnoreArray+=($(echo "TRUE"))
            nothingToReport="FALSE"
        else
            winIgnoreArray+=($(echo "FALSE"))
            nothingToReport="TRUE"
        fi
        if [ "${winHiddenState[$winCounter]}" = "FALSE" ] && [ "${winResFSArray[$winCounter]}" = "TRUE" ] && [ "${winIgnoreArray[$winCounter]}" = "FALSE" ]
        then
            echo "   - $winCounter Criteria for Komorebi kill met"
            komorebiTriggerKill+=($(echo "TRUE"))
            nothingToReport="FALSE"
        else
            komorebiTriggerKill+=($(echo "FALSE"))
            nothingToReport="TRUE"
        fi
        if [ "${nothingToReport}" = "TRUE" ]
        then
            echo "   - $winCounter No Action Needed"
        fi
        ((winCounter++))
        # updateIFS restore
        winTable=$(echo "$winTable\n| ${winTableIndexArray[-1]} | ${winIdArray[-1]} | ${winNameArray[-1]} | ${winOnMonArray[-1]} | ${winResWArray[-1]} | ${winResHArray[-1]} | ${winResMaxWArray[-1]} | ${winResMaxHArray[-1]} | ${winResFSArray[-1]} | ${winHiddenState[-1]} | ${winIgnoreArray[-1]} | ${komorebiTriggerKill[-1]}")
    done
    if [[ "${komorebiTriggerKill[@]}" =~ "TRUE" ]]
    then
        killKomorebi="TRUE"
    else
        killKomorebi="FALSE"
    fi
    echo -e $winTable | column -t -s '|'
    ###
}

function cleanUp() {
    echo "cleaning up arrays"
    # all vars in getMonitors
    unset monList monTable monIndexArray monNameArray monTopArray monLeftArray monBotArray monRightArray monCounter
    # all vars in getWindows
    unset winList winTable winTableIndexArray winIdArray winNameArray winResWArray winResHArray winResMaxWArray winResMaxHArray winResFSArray winHiddenState winIgnoreArray komorebiTriggerKill winTopCoordsArray winLeftCoordsArray
}

function killKPid() {
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
    #declaring arrays globally
    echo "Generating monitor arrays"
    updateIFS newline
    declare -A monList=$(xrandr --listactivemonitors | grep -v Monitors)
    updateIFS restore
    declare -a monIndexArray
    declare -a monNameArray
    declare -a monTopArray
    declare -a monLeftArray
    declare -a monBotArray
    declare -a monRightArray
    declare -a monMaxWArray
    declare -a monMaxHArray
    getMonitors

    # Creates the main Associative Array where multiple index'd arrays will be built.
    # The hope is that this will allow me to pinpoint items by building out a sort of bash/db (THIS IS ABSOLUTELY NOT THE BEST WAY TO DO SOMETHING LIKE THIS)
    declare -A winList=$(xwininfo -root -int -tree | grep -v 'Parent\|(has no name)\|child\|BDHF\|Desktop' | awk '{$1=$1};1' | grep -v '+-' | tr -d '@!|":()' | sed '/^$/d' | sed 's/^/\"/g' | cut -d + -f 1,4,5 | sed 's/$/\"/g' | tr -s ' ')
    # The following arrays are declared in the order they are called in the below for loop
    declare -a winTableIndexArray
    declare -a winIdArray
    declare -a winNameArray
    declare -a winTopCoords
    declare -a winLeftCoords
    declare -a winOnMonArray
    declare -a winResWArray
    declare -a winResHArray
    declare -a winResMaxWArray
    declare -a winResMaxHArray
    declare -a winResFSArray
    declare -a winHiddenState
    declare -a winIgnoreArray
    declare -a komorebiTriggerKill
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
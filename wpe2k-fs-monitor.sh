
#!/bin/bash
errorFound="false"

killKPid() {
    komorebiPids=$(ps -ef | grep komorebi | grep -v grep | awk '{print$2}')
    if [ "${1}" = "true" ]
    then
        echo "true"
        komorebiPids=$(echo $komorebiPids | tr ' ' '\n' | tail -n+2)
    fi
    for kpid in ${komorebiPids}
    do
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

while [ "${errorFound}" = "false" ]
do
    hPercent="0.95" # written as a decimal
    wPercent="1" # written as a decimal
    # gets the combined resolution of all monitors
    maxMonRes=$(xwininfo -root | awk -F'[ +x]' '$3 ~ /-geometry/ {printf "%dx%d",$4/'"$(xrandr | grep ' connected ' | wc -l)"',$5}')

    maxMonResW=$(echo $maxMonRes | cut -d x -f 1)
    maxMonResH=$(echo $maxMonRes | cut -d x -f 2)
    maxMonResWp=$(awk -v n=$maxMonResW 'BEGIN{print int(n*1)}')
    maxMonResHp=$(awk -v n=$maxMonResH 'BEGIN{print int(n*0.95)}')
    monResWpHp=$(echo "${maxMonResWp}x${maxMonResHp}")

    # checks to see if any windows are match the width % output.
    declare -a winMaxW=$(xwininfo -root -tree | grep $maxMonResWp | grep -v "\(Desktop\|has no name\|@!0,0;BDHF\|mutter guard window\)" | sed "s/^.*${maxMonResWp}/${maxMonResWp}/" | cut -d + -f 1 | tr '\n' ' ')
    
    if [ -z $winMaxW ]
    then
        echo "Height lower than ${maxMonResHp}"
        echo "No fullscreen app detected."
        kpidCount=$(ps -ef | grep komorebi | grep -v grep | awk '{print$2}' | wc -l)
        case $kpidCount in
        0) /System/Applications/komorebi &
            zenity --notification\
            --window-icon="dialog-information" \
            --text="wpk2k has launched komorebi"
             ;;
        1) echo "Komorebi already running" ;; 
        *) echo "More than 1 instance of Komorebi running. Killing all but 1."
            keepAlive="true"
            killKPid $keepAlive
            ;; 
        esac
    else
        for i in ${winMaxW[@]}
        do
            winH=$(echo $i | cut -d x -f 2)
            if [ $winH -gt $maxMonResHp ]
            then
                killKPid
                zenity --notification\
                --window-icon="dialog-information" \
                --text="wpe2k has closed komorebi"
            else
                echo "Height lower than ${maxMonResHp}"
                echo "No fullscreen app detected."
                /System/Applications/komorebi &
                zenity --notification\
                --window-icon="dialog-information" \
                --text="wpe2k has launched komorebi"
            fi
        done
    fi
    sleep 3
done
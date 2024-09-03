#!/bin/bash
# Author: TJ Hoth
# Creation Date: 08-27-2024
# Scope: This script is used to migrate video wallpapers from wallpaper engine on steam into Komorebi

# Credits: 
# Graphical interface: https://www.baeldung.com/linux/shell-script-simple-select-menu

# Define Common Paths
wpe2kDir="/home/${USER}/wpe2k/"
wpe2kTempDir="${wpe2kDir}tmp/"
logFile="${wpe2kDir}wpe2k-migrate.log"
wpe2krepo="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Make Directories
mkdir -p ${wpe2kDir}
mkdir -p ${wpe2kTempDir}

# Menu Lists
mmitems=("Re-run Setup" "Migrate" "Main Menu")

# General Variables
logInfo="[INFO]"
logWarn="[WARN]"
logError="[ERROR]"
logExec="[EXEC]"

greenCheck="U1F2705"

# Logging Function
log() {
    local logDT=$(date +"%Y-%m-%d %H:%M:%S.%3N")
    local logM="$@"
    # Define $lm when generating the log line
    echo "$logDT - $logM" >>$logFile
}

zenityCheck() {
    echo "Checking for Zenity..."
    which zenity >>/dev/null
    if [ $? = 0 ]
    then
        echo "Zenity found on system"
    else
        echo "Zenity not found. Please install zenity... Instructions can be found here: https://linuxconfig.org/how-to-use-graphical-widgets-in-bash-scripts-with-zenity"
    fi
}

setup() {
    local title="Setup"
    (
        # Initializing script and checking prerequisits
        echo "20"
        echo "# Initializing script and checking prerequisite" ; sleep 1
        # Verify Steam is installed
        echo "30"
        echo "# Verifying steam installation" ; sleep 1
        checkCommand=$(which steam)
        logMessage=$(echo "which steam | $checkCommand"); log "$logExec" "$logMessage"
        which steam
        if [ $? = 0 ]
        then
            logMessage="Setup: Steam is installed"; log "$logInfo" "$logMessage"
        else
            logMessage="Setup: Steam is not installed on this sytem. Please install steam."; log "$logError" "$logMessage"
            zenity --error \
            --text="Steam was not found. Please install steam."
            exit 0
        fi

        # Check home dir for .steam file
        echo "40"
        echo "# Checking home dir for .steam directory" ; sleep 1
        checkCommand=$(ls -a /home/$USER | grep .steam$)
        logMessage=$(echo "ls -a /home/$USER | grep .steam$ | $checkCommand"); log "$logExec" "$logMessage"
        ls -a /home/$USER | grep .steam$
        if [ $? = 0 ]
        then
            logMessage="Setup: .steam directory is located in home"; log "$logInfo" "$logMessage"
        else
            logMessage="Setup: .steam directory was not located in home. Please submit a bug so I can catch your steam location in future updates."; log "$logError" "$logMessage"
            zenity --error \
            --text="~/.steam was not found. Please see $logFile"
            exit 0
        fi

        # Check for Wallpaper Engine in steam directory
        echo "50"
        echo "# Checking for wallpaper engine" ; sleep 1
        ls -a /home/$USER/.steam/steam/steamapps/common | grep wallpaper_engine
        if [ $? = 0 ]
        then
            logMessage="Setup: wallpaper engine was found."; log "$logInfo" "$logMessage"
        else
            logMessage="Setup: wallpaper engine was not found in /home/$USER/.steam/steam/steamapps/common Please ensure you've installed Wallpaper engine through steam using proton."; log "$logError" "$logMessage"
            zenity --error \
            --text="Unable to locate wallpaper engine. Please see $logFile"
            exit 0
        fi

        # Checks to see if Komorebi is installed.
        echo "60"
        echo "# Checking for Komorebi" ; sleep 1
        checkCommand=$(dpkg-query -W komorebi)
        logMessage=$(echo "dpkg-query -W komorebi | $checkCommand"); log "$logExec" "$logMessage"
        dpkg-query -W komorebi >>/dev/null
        if [ $? = 0 ]
        then
            logMessage="Setup: Komorebi was found."; log "$logInfo" "$logMessage"
        else
            logMessage="Setup: Komorebi was not found. This application is searched using the above command. Please check your output and ensure Komorebi is installed properly."; log "$logError" "$logMessage"
            zenity --error \
            --text="Unable to locate Komorebi. Please see $logFile"
            exit 0
        fi

        # Checks to see if Komorebi is installed.
        echo "70"
        echo "# Checking for /System/Resources/Komorebi" ; sleep 1
        checkCommand=$(if [ -d /System/Resources/Komorebi ]; then echo "/System/Resources/Komorebi exists"; else echo "/System/Resources/Komorebi does not exist."; fi)
        logMessage=$(echo "$checkCommand"); log "$logExec" "$logMessage"

        if [ -d /System/Resources/Komorebi ]
        then
            logMessage="Setup: Komorebi resources directory was found."; log "$logInfo" "$logMessage"
        else
            logMessage="Setup: Komorebi resources directory was not found. Please ensure Komorebi was properly installed."; log "$logError" "$logMessage"
            zenity --error \
            --text="Unable to locate Komorebi resources directory. Please see $logFile"
            exit 0
        fi

        echo "80"
        echo "# Checking for ffmpeg" ; sleep 1
        checkCommand=$(which ffmpeg)
        logMessage=$(echo "which ffmpeg | $checkCommand"); log "$logExec" "$logMessage"
        which ffmpeg
        if [ $? = 0 ]
        then
            logMessage="Setup: ffmpeg is installed"; log "$logInfo" "$logMessage"
        else
            logMessage="Setup: ffmpeg is not installed on this sytem. Please install ffmpeg."; log "$logError" "$logMessage"
            zenity --error \
            --text="ffmpeg was not found. Please install ffmpeg."
            exit 0
        fi

        echo "85"
        echo "# All checks passed" ; sleep 1
        echo "100" ; sleep 1
    ) | 
    zenity --progress \
    --title="$title" \
    --percentage=0 \
    --auto-close

    # UPDATE: service now users the --user in systemd
    zenity --question \
    --text="This step turns the wpe2k-fs-monitor.sh script into a service. This will do it's best to kill komorebi when a full screen application is up and will start komorebi back up when no full screen app is detected.\n\n would you like to configure this script as a service?"
    case $? in
    0) zenity --password --title="Sudo Password" | sudo -Sv
        (
            echo "10"
            echo "# Generating Service file"; sleep 1
            echo -e "[Unit]\nDescription=Komorebi Monitoring Service\n\n[Service]\nType=simple\nExecStart=/bin/bash ${wpe2krepo}/wpe2k-fs-monitor.sh\n\n[Install]\nWantedBy=graphical-session.target" | sudo -S tee /etc/systemd/user/wpe2k-fs-monitor.service
            sudo -S chmod +x /etc/systemd/user/wpe2k-fs-monitor.service
            echo "20"
            echo "reloading systemctl"
            sudo -S systemctl --user daemon-reload
            echo "30"
            echo "# Enabling and setting wpe2k-fs-monitor.service to start on boot"
            sudo -S systemctl --user enable wpe2k-fs-monitor.service
            echo "40"
            echo "# Starting service"
            sudo -S systemctl --user start wpe2k-fs-monitor.service
            echo "50"
            echo "# Verifying service is running"
            sudo -S systemctl --user status -l wpe2k-fs-monitor.service | grep running
            if [ $? = 0 ]
            then
                echo "wpe2k-fs-monitor.service was found and is running"
            else
                zenity --error \
                --text="service was not running. Please investigate further."
                exit 0
            fi
        ) |
        zenity --progress \
        --title="$title" \
        --percentage=0 \
        --auto-close ;;
    1) echo "Skipping..." ;;
    5) echo "Timeout reached. Skipping" ;;
    *) echo "Invalid Input" ;;
    esac
}

migrate() {
    # Locate the steam workshop directory for wpe
    if [ -f ${wpe2kDir}komorebi-wpe-workshop.txt ]
    then
        logMessage="Migrate: workshop directory already stored"; log "$logInfo" "$logMessage"
        wpeWorkshopLocation=$(cat ${wpe2kDir}komorebi-wpe-workshop.txt)
    else
        zenity --info --text="Please select the directory where wallpaper engine stores workshop items. This can be found by right clicking on an item in WPE's UI and clicking \"open in explorer\""
        wpeWorkshopLocation=`zenity --file-selection --directory --filename="/home/$USER/.steam/steam/steamapps/workshop/content/" --title="Please locate your steam workshop directory"`
        case $? in
        0) echo $wpeWorkshopLocation >${wpe2kDir}komorebi-wpe-workshop.txt ;;
        1) echo "No file selected." ;;
        -1) echo "An unexpected error has occurred." ;;
        esac
    fi
    # Create a list of all directories in the wpe steam workship dir
    local title="Migrating WPE videos to Komorebi"
    (
        echo "2"
        echo "# Generating video-wallpapers.lst file"; sleep 1
        grep -r '"type" : "video"' ${wpeWorkshopLocation} | cut -d '/' -f 10 >${wpe2kDir}video-wallpapers.lst
        wpeDirCounter=1
        echo "3"
        echo "# Beginning Migration of video files"
        for wpeDir in $(cat ${wpe2kDir}video-wallpapers.lst)
        do
            wpeDirCounter=$((wpeDirCounter + 1))
            wpPath="${wpeWorkshopLocation}/${wpeDir}"
            logMessage=$(echo "Migrate: type VIDEO found in ${wpPath}"); log "$logExec" "$logMessage"
            getTitle=$(grep '"title" : ' ${wpeWorkshopLocation}/${wpeDir}/project.json | cut -d '"' -f 4 | tr ' ' '-' | tr -d '/')
            getFile=$(ls ${wpeWorkshopLocation}/${wpeDir} | egrep 'mp4|webm')
            if [ -z "${getFile}" ]
            then
                logMessage=$(echo "Migrate: $getFile is missing a video file... skipping."); log "$logWarn" "$logMessage"
                continue
            fi
            logMessage=$(echo "Migrate: $getTitle - $getFile"); log "$logInfo" "$logMessage"
            echo "# ${getTitle} - ${wpeDir}"
            echo "${wpeDirCounter}"

            mkdir -p -p "${wpe2kTempDir}${getTitle}"
            ffmpeg -y -loglevel quiet -ss 00:00:01 -i "${wpeWorkshopLocation}/${wpeDir}/${getFile}" -frames:v 1 -q:v 5 "${wpe2kTempDir}${getTitle}/wallpaper.jpg" >>/dev/null
            cp "${wpeWorkshopLocation}/${wpeDir}/${getFile}" "${wpe2kTempDir}${getTitle}"
            echo -e "[Info]\nWallpaperType=video\nVideoFileName=$getFile\n\n[DateTime]\nVisible=false\nParallax=true\nMarginTop=0\nMarginRight=0\nMarginLeft=10\nMarginBottom=45\nRotationX=0\nRotationY=0\nRotationZ=0\nPosition=center\nAlignment=center\nAlwaysOnTop=true\nColor=#dd22dd22dd22\nAlpha=255\nShadowColor=#dd22dd22dd22\nShadowAlpha=255\nTimeFont=Lato Light 30\nDateFont=Lato Light 20" >${wpe2kTempDir}${getTitle}/config
            unset getFile
        done
        echo "80"
        echo "# Copying directories from /home/tjhoth/wpe2k/tmp/ to /System/Resources/Komorebi"
        zenity --password --title="Sudo Password" --text="Please enter your sudo password.\nThis is only used for this copy." | sudo -S cp -r ${wpe2kTempDir}* /System/Resources/Komorebi
        echo "90"
        echo "# Cleaning up temporary files"
        rm -rf /home/tjhoth/wpe2k/tmp
        echo "100"; sleep 1
    ) |
    zenity --progress \
    --title="$title" \
    --percentage=0 \
    --auto-close

    zenity --info \
    --text="Migration complete."
}

# main body
setup
title="Komorebi WPE"
prompt="Main Menu"
while mmitem=$(zenity \
        --title="$title" \
        --text="$prompt" \
        --list \
        --column="Options" "${mmitems[@]}")
do
    case "$mmitem" in
    "${mmitems[0]}") # Setup
        logMessage="Main Menu: User selected $mmitem"; log "$logInfo" "$logMessage"
        setup ;;
    "${mmitems[1]}") # Migrate
        logMessage="Main Menu: User selected $mmitem"; log "$logInfo" "$logMessage"
        migrate ;;
    "${mmitems[2]}") # Main Menu
        logMessage="Main Menu: User Selected $mmitem"; log "$logInfo" "$logMessage" ;;
    *) #fallback
        logMessage="Main Menu: User selected invalid option. Fallback to main menu."; log "$logWarn" "$logMessage";;
    esac
done
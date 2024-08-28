#!/bin/bash
# Author: TJ Hoth
# Creation Date: 08-27-2024
# Scope: This script is used to migrate video wallpapers from wallpaper engine on steam into Komorebi

# Credits: 
# Graphical interface: https://www.baeldung.com/linux/shell-script-simple-select-menu

# Define Log
logFile="/home/${USER}/komorebi-wpe-migrate.log"

# Menu Lists
mmitems=("Setup" "Migrate" "Main Menu")

# General Variables
logInfo="[INFO]"
logWarn="[WARN]"
logError="[ERROR]"
logExec="[EXEC]"

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
    local prompt="Please fill out the following form"
    (
        # Verify Steam is installed
        echo "5" ; sleep 1
        echo "# Verifying steam installation"
        which steam >> /dev/null
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
        echo "10" ; sleep 1
        echo "# Checking home dir for .steam directory"
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
        echo "15" ; sleep 1
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
        echo "20" ; sleep 1
        echo "# Checking for Komorebi" ; sleep 1
        komorebi=$(dpkg-query -W komorebi)
        logMessage=$(echo "dpkg-query -W komorebi | $komorebi"); log "$logExec" "$logMessage"
        dpkg-query -W komorebi >> /dev/null
        if [ $? = 0 ]
        then
            logMessage="Setup: Komorebi was found."; log "$logInfo" "$logMessage"
        else
            logMessage="Setup: Komorebi was not found. This application is searched using the above command. Please check your output and ensure Komorebi is installed properly."; log "$logError" "$logMessage"
            zenity --error \
            --text="Unable to locate Komorebi. Please see $logFile"
            exit 0
        fi
        
        ###### CURRENT WORK HERE ######
        
        echo "75" ; sleep 1
        echo "# Rebooting system" ; sleep 1
        echo "100" ; sleep 1
    ) | 
    zenity --progress \
    --title="$title" \
    --text="$prompt" \
    --percentage=0 \
    --auto-close 
}

migrate() {
    echo "pending"
}

# main menu
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
        setup
        ;; 
    "${mmitems[1]}") # Migrate
        logMessage="Main Menu: User selected $mmitem"; log "$logInfo" "$logMessage"
        ;; 
    "${mmitems[2]}") # Main Menu
        logMessage="Main Menu: User Selected $mmitem"; log "$logInfo" "$logMessage"
        ;; 
    *) #fallback
        logMessage="Main Menu: User selected invalid option. Fallback to main menu."; log "$logWarn" "$logMessage"
        ;; 
    esac
done
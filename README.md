# wpe2k
## Pre-requisits

1. [Komorebi](https://github.com/cheesecakeufo/komorebi)
1. [Steam](https://store.steampowered.com/)
2. Wallpaper Engine installed using steam and proton
3. ffmeg (this was on my distro by default. You may need to install it yourself.)
4. Zenity (this was on my distro by default. You may need to install it yourself.)

## How it works
This script has you select the steam workshop directory where wallpaper engine items are stored. It will then run through those directories to check if they are the type "video". Copies the file, generates a basic Komorebi config file, and pulls a frame out of the video using FFMPEG for the thumbnail.

It then migrates all those directories into Komorebi

## Before you run
Open up Wallpaper engine's UI go into the workshop and go to the **Type (filtered)** section and ensure only Video is checked. This will ensure what you choose to subscribe to is compatible w/ Komorebi.

Subscribe to the items you want.

## Running the script
Running the script is pretty straight forward. It does it's best to check for dependencies. Then You'll select migrate and ok. This will take you through the migration phase. If all comes out well you should be able to reload Komorebi and the new wallpapers should be there.

I have noticed that sometimes there is some weird reversion back to old wallpapers and sometimes a restart is required for some komorebi config changes but I observed this before I made this automation so I'm assuming it's related to Komorebi.

## Issues
If you have any issues feel free to submit one. Please include the relevant parts of the logs which should be stored in the wpe2k directory in your home.

## Demo

https://youtu.be/jGYQJsBPmhU
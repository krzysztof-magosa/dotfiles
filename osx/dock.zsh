#!/bin/zsh


function add_icon() {
    if [ -d "$1" ] ; then
        dockutil --no-restart --add "$1"
    fi
}


dockutil --no-restart --remove all
add_icon "/Applications/Ghostty.app"
add_icon "/Applications/Microsoft Edge.app"
add_icon "/Applications/Visual Studio Code.app"
add_icon "/System/Applications/Notes.app"
add_icon "/Applications/Microsoft Outlook.app"
add_icon "/Applications/Microsoft Teams.app"
add_icon "/System/Applications/System Settings.app"
add_icon "/Applications/Enpass.app"
add_icon "/System/Applications/Calendar.app"
add_icon "$HOME/Downloads"

killall Dock


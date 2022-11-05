#!/bin/zsh


function add_icon() {
    if [ -d "$1" ] ; then
        dockutil --no-restart --add "$1"
    fi
}


dockutil --no-restart --remove all
add_icon "/System/Volumes/Preboot/Cryptexes/App/System/Applications/Safari.app"
add_icon "/Applications/iTerm.app"
add_icon "/System/Applications/Reminders.app"
add_icon "/System/Applications/Notes.app"
add_icon "/Applications/Microsoft Outlook.app"
add_icon "/Applications/Microsoft Teams.app"
add_icon "/Applications/Enpass.app"
add_icon "/System/Applications/System Settings.app"

killall Dock


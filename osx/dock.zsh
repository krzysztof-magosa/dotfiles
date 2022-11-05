#!/bin/zsh

dockutil --no-restart --remove all
dockutil --no-restart --add "/System/Volumes/Preboot/Cryptexes/App/System/Applications/Safari.app"
dockutil --no-restart --add "/Applications/iTerm.app"
dockutil --no-restart --add "/System/Applications/Reminders.app"
dockutil --no-restart --add "/System/Applications/Notes.app"
dockutil --no-restart --add "/Applications/Enpass.app"
dockutil --no-restart --add "/System/Applications/System Settings.app"

killall Dock


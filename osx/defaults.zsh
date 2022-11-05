#!/bin/zsh

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Disable smart quotes, they're annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable smart dashes, they're annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Enable tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Do not show recent apps in dock
defaults write com.apple.dock show-recents -bool false

# Keep folders on top
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Don't add shadow on screenshots
defaults write com.apple.screencapture disable-shadow -bool false

# Show extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Do not group files
defaults write com.apple.finder FXPreferredGroupBy -string None

# Use list view
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Disable auto correction
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

# Disable auto capitalization
defaults write -g NSAutomaticCapitalizationEnabled -bool false

# Do not replace double space with dot
defaults write -g NSAutomaticPeriodSubstitutionEnabled -bool false

# Do not use relative dates
/usr/libexec/PlistBuddy "$HOME/Library/Preferences/com.apple.finder.plist" -c 'Delete "StandardViewSettings:ExtendedListViewSettings:useRelativeDates" bool' 2>/dev/null
/usr/libexec/PlistBuddy "$HOME/Library/Preferences/com.apple.finder.plist" -c 'Add "StandardViewSettings:ExtendedListViewSettings:useRelativeDates" bool false'
/usr/libexec/PlistBuddy "$HOME/Library/Preferences/com.apple.finder.plist" -c 'Delete "StandardViewSettings:ListViewSettings:useRelativeDates" bool' 2>/dev/null
/usr/libexec/PlistBuddy "$HOME/Library/Preferences/com.apple.finder.plist" -c 'Add "StandardViewSettings:ListViewSettings:useRelativeDates" bool false'

# Sort by modified date
/usr/libexec/PlistBuddy "$HOME/Library/Preferences/com.apple.finder.plist" -c 'Delete "StandardViewSettings:ExtendedListViewSettings:sortColumn" string' 2>/dev/null
/usr/libexec/PlistBuddy "$HOME/Library/Preferences/com.apple.finder.plist" -c 'Add "StandardViewSettings:ExtendedListViewSettings:sortColumn" string dateModified'
/usr/libexec/PlistBuddy "$HOME/Library/Preferences/com.apple.finder.plist" -c 'Delete "StandardViewSettings:ListViewSettings:sortColumn" string' 2>/dev/null
/usr/libexec/PlistBuddy "$HOME/Library/Preferences/com.apple.finder.plist" -c 'Add "StandardViewSettings:ListViewSettings:sortColumn" string dateModified'

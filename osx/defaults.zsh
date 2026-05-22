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

# Fast key repeat (needs re-login)
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Do not show recent apps in dock
defaults write com.apple.dock show-recents -bool false

# Keep folders on top
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show path bar and status bar
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true

# Search current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# No .DS_Store on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Don't add shadow on screenshots
defaults write com.apple.screencapture disable-shadow -bool true

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

# Remap Caps Lock to Escape
defaults -currentHost write -g com.apple.keyboard.modifiermapping -array '<dict><key>HIDKeyboardModifierMappingDst</key><integer>30064771113</integer><key>HIDKeyboardModifierMappingSrc</key><integer>30064771129</integer></dict>'

# linear mouse
defaults write .GlobalPreferences com.apple.mouse.scaling -1

# do not use moving animations
defaults write com.apple.universalaccess reduceMotion -bool true

# Full keyboard access in dialogs (Tab between all controls)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Don't rearrange Mission Control spaces by recent use
defaults write com.apple.dock mru-spaces -bool false

# Disable crash reporter dialog
defaults write com.apple.CrashReporter DialogType -string "none"

# Require password immediately after sleep
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

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

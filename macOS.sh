#!/bin/sh
###################
# macOS setup
###################

COMPUTER_NAME="sac"
# Set computer name (as done via System Preferences → Sharing)
sudo scutil --set ComputerName "$COMPUTER_NAME"
sudo scutil --set HostName "$COMPUTER_NAME"
sudo scutil --set LocalHostName "$COMPUTER_NAME"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$COMPUTER_NAME"

# keyboard settings
# https://gist.github.com/kconragan/2510186
defaults write -g ApplePressAndHoldEnabled -bool false

# disable gatekeeper
sudo spctl --master-disable

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Disable automatic capitalization as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic period substitution as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Toggle Fn
defaults write -g com.apple.keyboard.fnState -bool true

# Trackpad: set Tracking Speed(from 0 to 3)
defaults write -g com.apple.trackpad.scaling -float 1

# Trackpad: use three finger tap to Look up & data detectors
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerTapGesture -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerTapGesture -int 2

# Trackpad: Enable three fingers drag
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -int 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -int 1

# Trackpad: Enable App Expose
defaults write com.apple.dock showAppExposeGestureEnabled -int 1

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior 1

# Trackpad: click or tap two finger to right-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -int 1
#defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
#defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -int 1

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 12

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop/screenshots"

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Finder: allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Show the /Volumes folder
sudo chflags nohidden /Volumes

######################
# apps
#####################
# set preview to continous scroll mode
defaults write com.apple.Preview PVPDFDisplayMode 1

# set Flycut's sticky bazel, login startup and icon
defaults write com.generalarcade.flycut stickyBezel 1
defaults write com.generalarcade.flycut loadOnStartup 1
defaults write com.generalarcade.flycut menuIcon 3

# set sourcetree's allow force push
defaults write com.torusknot.SourceTreeNotMAS allowForcePush 1

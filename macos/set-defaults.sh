#!/bin/sh

# Set reasonable macOS defaults.
# Inspired by: https://github.com/mathiasbynens/dotfiles
# More commands here: https://gist.github.com/brandonb927/3195465

# If not ran on macOS, exit
if [ "$(uname -s)" != "Darwin" ]; then
	exit 0
fi

set +e

# https://www.howtogeek.com/267463/how-to-enable-key-repeating-in-macos.
defaults write -g ApplePressAndHoldEnabled -bool false
echo 'Fast key repeat. Requires restart.'

# https://twitter.com/jordwalke/status/1230582824224165888 fast repeat.
defaults write NSGlobalDomain KeyRepeat -int 1

defaults write -g NSAutomaticWindowAnimationsEnabled -bool false
echo 'Fast opening and closing windows and popovers'

# https://robservatory.com/speed-up-your-mac-via-hidden-prefs/
defaults write NSGlobalDomain NSWindowResizeTime 0.001
echo 'Sped up dialogue boxes'

defaults write org.m0k.transmission WarningDonate -bool false
echo 'Hide Transmission app donate message'

defaults write -g WebAutomaticTextReplacementEnabled -bool false
echo 'Disable macOS/iOS text expansion'

echo 'Some commands here require restart! Please do that for them to take effect.'

# removes annoying asking for passwords for git
git config --global credential.helper osxkeychain

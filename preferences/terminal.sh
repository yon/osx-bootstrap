#!/usr/bin/env bash

defaults write com.apple.terminal SecureKeyboardEntry -bool true
defaults write com.apple.terminal ShowLineMarks -bool false
defaults write com.apple.terminal StringEncodings -array 4

/usr/libexec/PlistBuddy \
  -c 'Delete :Window\ Settings:Basic:Bell' \
  -c 'Delete :Window\ Settings:Basic:ShouldRestoreContent' \
  -c 'Delete :Window\ Settings:Basic:ShowActiveProcessArgumentsInTitle' \
  -c 'Delete :Window\ Settings:Basic:ShowActiveProcessInTitle' \
  -c 'Delete :Window\ Settings:Basic:ShowCommandKeyInTitle' \
  -c 'Delete :Window\ Settings:Basic:ShowDimensionsInTitle' \
  -c 'Delete :Window\ Settings:Basic:ShowRepresentedURLInTitle' \
  -c 'Delete :Window\ Settings:Basic:ShowRepresentedURLPathInTitle' \
  -c 'Delete :Window\ Settings:Basic:ShowShellCommandInTitle' \
  -c 'Delete :Window\ Settings:Basic:ShowTTYNameInTabTitle' \
  ~/Library/Preferences/com.apple.terminal.plist

/usr/libexec/PlistBuddy \
  -c 'Delete :Window\ Settings:Basic:VisualBell' \
  -c 'Delete :Window\ Settings:Basic:WindowTitle' \
  -c 'Delete :Window\ Settings:Basic:columnCount' \
  -c 'Delete :Window\ Settings:Basic:rowCount' \
  -c 'Delete :Window\ Settings:Basic:shellExitAction' \
  -c 'Delete :Window\ Settings:Basic:useOptionAsMetaKey' \
  ~/Library/Preferences/com.apple.terminal.plist

curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/master/preferences/terminal.plist > /tmp/terminal.plist

/usr/libexec/PlistBuddy \
  -c "Merge /tmp/terminal.plist :Window\ Settings:Basic" \
  ~/Library/Preferences/com.apple.terminal.plist

rm /tmp/terminal.plist

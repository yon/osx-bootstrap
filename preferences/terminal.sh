#!/usr/bin/env bash

# Terminal.app security and display settings
defaults write com.apple.terminal SecureKeyboardEntry -bool true                   # Enable secure keyboard entry (prevents other apps from reading keystrokes)
defaults write com.apple.terminal ShowLineMarks -bool false                        # Hide line marks in Terminal
defaults write com.apple.terminal StringEncodings -array 4                         # Set string encodings (4 = UTF-8)

# Clean up existing Basic profile settings that will be replaced
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
  ~/Library/Preferences/com.apple.terminal.plist 2>/dev/null || true

# Continue cleaning up Basic profile settings
/usr/libexec/PlistBuddy \
  -c 'Delete :Window\ Settings:Basic:VisualBell' \
  -c 'Delete :Window\ Settings:Basic:WindowTitle' \
  -c 'Delete :Window\ Settings:Basic:columnCount' \
  -c 'Delete :Window\ Settings:Basic:deleteSendsBackspace' \
  -c 'Delete :Window\ Settings:Basic:rowCount' \
  -c 'Delete :Window\ Settings:Basic:shellExitAction' \
  -c 'Delete :Window\ Settings:Basic:useOptionAsMetaKey' \
  ~/Library/Preferences/com.apple.terminal.plist 2>/dev/null || true

# Download and apply custom terminal profile settings
tmpfile=`/usr/bin/mktemp -t terminal.plist`
curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/master/preferences/terminal.plist > ${tmpfile}

# Merge the downloaded settings into the Basic profile
/usr/libexec/PlistBuddy \
  -c "Merge ${tmpfile} :Window\ Settings:Basic" \
  ~/Library/Preferences/com.apple.terminal.plist

# Clean up temporary file
rm ${tmpfile}

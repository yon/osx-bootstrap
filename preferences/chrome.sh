#!/usr/bin/env bash

# Google Chrome preferences configuration
# Sets up Chrome download directory and other preferences

# Set Chrome download directory
defaults write com.google.Chrome DownloadDefaultDirectory "/Users/yon/yon@milliped.com - Google Drive/My Drive/Downloads"

# Disable Chrome's built-in print preview dialog
defaults write com.google.Chrome DisablePrintPreview -bool true

# Disable Chrome's automatic tab discarding
defaults write com.google.Chrome DisableTabDiscarding -bool true
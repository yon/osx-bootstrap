#!/usr/bin/env bash

# Install Xcode CommandLineTools
if [ ! -f /Library/Developer/CommandLineTools/usr/bin/gnumake ]; then
  touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
  CLI=$(softwareupdate --list | grep "\* Command Line Tools" | head -n 1 | awk -F"*" '{print $2}' | sed -e 's/^ *//' | tr -d '\n');
  softwareupdate --install "$CLI" --verbose;
  rm /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
fi

# Run osx-bootstrap Makefile; target default
curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/master/Makefile | cat | make -

#!/usr/bin/env bash

echo "Configuring Rectangle window manager..."

# Check if Rectangle config file exists and import it
if [ -f "$(dirname "$0")/rectangle-settings.json" ]; then
    echo "Importing Rectangle configuration from rectangle-settings.json..."

    # Kill Rectangle if it's running to ensure clean import
    killall Rectangle 2>/dev/null || true

    # Import the configuration by parsing the JSON and applying settings
    if command -v python3 >/dev/null 2>&1; then
        # Validate JSON with python first
        if python3 -m json.tool "$(dirname "$0")/rectangle-settings.json" >/dev/null 2>&1; then
            echo "Configuration file is valid JSON"

            # Parse and apply Rectangle settings using python
            echo "Importing Rectangle settings..."
            python3 << EOF
import json
import subprocess
import sys

try:
    with open("$(dirname "$0")/rectangle-settings.json", 'r') as f:
        config = json.load(f)

    # Apply defaults
    if 'defaults' in config:
        for key, value in config['defaults'].items():
            if 'bool' in value:
                subprocess.run(['defaults', 'write', 'com.knollsoft.Rectangle', key, '-bool', str(value['bool']).lower()])
            elif 'int' in value:
                subprocess.run(['defaults', 'write', 'com.knollsoft.Rectangle', key, '-int', str(value['int'])])
            elif 'float' in value:
                subprocess.run(['defaults', 'write', 'com.knollsoft.Rectangle', key, '-float', str(value['float'])])

    print("Rectangle configuration imported successfully!")

except Exception as e:
    print(f"Error importing Rectangle config: {e}")
    sys.exit(1)
EOF
        else
            echo "Error: rectangle-settings.json is not valid JSON"
            exit 1
        fi
    else
        echo "Error: python3 command not found"
        exit 1
    fi
else
    echo "rectangle-settings.json not found, applying basic settings..."
    # Fallback to basic settings if config file is missing
    defaults write com.knollsoft.Rectangle gapSize -float 4                            # Set gap size between windows to 4 pixels
fi

echo "Rectangle configuration complete!"

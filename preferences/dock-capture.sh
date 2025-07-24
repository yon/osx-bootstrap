#!/usr/bin/env bash

echo "Capturing current dock configuration..."
echo

# Get current dock apps from plist
echo "# Current dock applications (in order):"

# Extract file-label values directly from the plist
defaults read com.apple.dock persistent-apps | grep 'file-label' | sed 's/.*"file-label" = \(.*\);/\1/' | sed 's/"//g' | sed 's/^ *//' | while read app; do
    if [ -n "$app" ]; then
        echo "dock_add_app \"$app\""
    fi
done

echo
echo "# Current dock folders/stacks with their settings:"
defaults read com.apple.dock persistent-others 2>/dev/null | awk '
/file-label/ { label = $0; gsub(/.*"file-label" = /, "", label); gsub(/;.*/, "", label); gsub(/"/, "", label) }
/arrangement/ { arrangement = $0; gsub(/.*arrangement = /, "", arrangement); gsub(/;.*/, "", arrangement) }
/displayas/ { displayas = $0; gsub(/.*displayas = /, "", displayas); gsub(/;.*/, "", displayas) }
/showas/ { showas = $0; gsub(/.*showas = /, "", showas); gsub(/;.*/, "", showas) }
/_CFURLString/ {
    url = $0; gsub(/.*"_CFURLString" = "file:\/\//, "", url); gsub(/";.*/, "", url)
    if (label && url) {
        print "# " label ": displayas=" displayas " showas=" showas " arrangement=" arrangement " (" url ")"
        label = ""; arrangement = ""; displayas = ""; showas = ""
    }
}'

echo
echo "# Settings legend:"
echo "# displayas: 0=folder, 1=stack"
echo "# showas: 0=automatic, 1=fan, 2=grid, 3=list"
echo "# arrangement: 1=name, 2=date added, 3=date modified, 4=date created, 5=kind"

echo
echo "# Current dock settings:"
tilesize=$(defaults read com.apple.dock tilesize 2>/dev/null || echo "48")
magnification=$(defaults read com.apple.dock magnification 2>/dev/null || echo "0")
largesize=$(defaults read com.apple.dock largesize 2>/dev/null || echo "64")
orientation=$(defaults read com.apple.dock orientation 2>/dev/null || echo "bottom")
autohide=$(defaults read com.apple.dock autohide 2>/dev/null || echo "0")
showrecents=$(defaults read com.apple.dock show-recents 2>/dev/null || echo "1")

echo "# Tile size: $tilesize"
echo "# Magnification enabled: $magnification (1=yes, 0=no)"
echo "# Large size (when magnified): $largesize"
echo "# Position: $orientation"
echo "# Auto-hide: $autohide (1=yes, 0=no)"
echo "# Show recents: $showrecents (1=yes, 0=no)"

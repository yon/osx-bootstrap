#!/usr/bin/env bash
set -euo pipefail

echo "Setting up backup SSH key..."

BACKUP_KEY="/Volumes/ring/ssh/id_ed25519"

# Check if ring.dmg is mounted
if [ ! -d "/Volumes/ring/ssh" ]; then
    echo "⚠ /Volumes/ring is not mounted. Mount ring.dmg first."
    echo "  Skipping backup key setup."
    exit 0
fi

# Check if backup key already exists
if [ -f "$BACKUP_KEY" ]; then
    echo "✓ Backup key already exists at $BACKUP_KEY"
else
    echo "Creating backup ed25519 key..."
    ssh-keygen -t ed25519 -C "yon@ring" -f "$BACKUP_KEY"
    echo "✓ Backup key created"
fi

# Add to macOS Keychain
echo "Adding passphrase to macOS Keychain..."
ssh-add --apple-use-keychain "$BACKUP_KEY"

echo ""
echo "✓ Backup key passphrase stored in Keychain"
echo ""
echo "Backup public key (add to servers as fallback):"
cat "${BACKUP_KEY}.pub"

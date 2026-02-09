#!/usr/bin/env bash
set -euo pipefail

echo "Configuring Git SSH signing..."

# Get user email from existing git config
# This email is used in allowed_signers for signature verification
# Must match your GitHub verified email for "Verified" badges
EMAIL=$(git config --global user.email || true)

if [ -z "$EMAIL" ]; then
    echo "⚠ Git user.email not set. Skipping signing setup."
    echo "  Configure with: git config --global user.email 'you@example.com'"
    exit 0
fi

# Check for Secure Enclave key
if [ ! -f ~/.ssh/id_ecdsa_sk_rk.pub ]; then
    echo "⚠ Secure Enclave key not found at ~/.ssh/id_ecdsa_sk_rk.pub"
    echo "  Run secure-enclave.sh first."
    exit 1
fi

# Configure Git to use SSH signing (alphabetized)
git config --global commit.gpgsign true
git config --global gpg.format ssh
git config --global gpg.ssh.allowedSignersFile ~/.ssh/allowed_signers
git config --global user.signingkey ~/.ssh/id_ecdsa_sk_rk.pub

# Add to allowed_signers (supports multiple keys from different machines)
ALLOWED_SIGNERS=~/.ssh/allowed_signers
NEW_ENTRY="$EMAIL namespaces=\"git\" $(cat ~/.ssh/id_ecdsa_sk_rk.pub)"

# Create file if it doesn't exist
touch "$ALLOWED_SIGNERS"

# Add entry if not already present, then sort and dedupe
if ! grep -qF "$(cat ~/.ssh/id_ecdsa_sk_rk.pub)" "$ALLOWED_SIGNERS" 2>/dev/null; then
    echo "$NEW_ENTRY" >> "$ALLOWED_SIGNERS"
    # Sort and dedupe in place
    sort -u -o "$ALLOWED_SIGNERS" "$ALLOWED_SIGNERS"
    echo "✓ Added key to allowed_signers"
else
    echo "✓ Key already in allowed_signers"
fi

echo "✓ Git configured to sign commits with Secure Enclave key"

# Add key to GitHub if gh is installed and authenticated
if command -v gh >/dev/null 2>&1 && gh auth status >/dev/null 2>&1; then
    KEY_TITLE="$(hostname) Secure Enclave"
    KEY_FILE=~/.ssh/id_ecdsa_sk_rk.pub

    # Check if key already exists on GitHub
    FINGERPRINT=$(ssh-keygen -lf "$KEY_FILE" | awk '{print $2}')

    if ! gh ssh-key list | grep -q "$FINGERPRINT"; then
        echo "Adding key to GitHub..."
        gh ssh-key add "$KEY_FILE" --type authentication --title "$KEY_TITLE"
        gh ssh-key add "$KEY_FILE" --type signing --title "$KEY_TITLE"
        echo "✓ Key added to GitHub (authentication + signing)"
    else
        echo "✓ Key already registered on GitHub"
    fi

    # Configure git credential helper to use gh
    gh auth setup-git
    echo "✓ Git credential helper configured to use gh"
else
    echo ""
    echo "Add your signing key to GitHub manually:"
    echo "  Settings → SSH and GPG keys → New SSH key → Key type: Signing Key"
    echo ""
    cat ~/.ssh/id_ecdsa_sk_rk.pub
fi

#!/usr/bin/env bash
set -euo pipefail

echo "Setting up Secure Enclave SSH..."

# Create SSH directory
mkdir -p ~/.ssh
chmod 700 ~/.ssh

# Set environment for Secure Enclave provider
export SSH_SK_PROVIDER=/usr/lib/ssh-keychain.dylib

# Check if Secure Enclave key already exists
if sc_auth list-ctk-identities -t ssh 2>/dev/null | grep -q "ssh"; then
    echo "✓ Secure Enclave SSH key already exists"
else
    echo "Creating Secure Enclave SSH key (Touch ID protected)..."
    sc_auth create-ctk-identity -l ssh -k p-256-ne -t bio

    # Export public key
    cd ~/.ssh
    ssh-keygen -w /usr/lib/ssh-keychain.dylib -K -N ""
    echo "✓ Secure Enclave SSH key created"
fi

# Display the key
echo ""
echo "Your Secure Enclave SSH keys:"
sc_auth list-ctk-identities -t ssh

echo ""
echo "Public key to add to servers/GitHub:"
cat ~/.ssh/id_ecdsa_sk_rk.pub 2>/dev/null || echo "(Run ssh-keygen -K to export)"

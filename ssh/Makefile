# SSH Setup Module
# Uses file-based targets for idempotency
# Requires: brew-bundle from parent (ensures gh is installed)

# Phony targets (alphabetized)
.PHONY: all backup-key git-signing help secure-enclave

# Default target
all: secure-enclave git-signing ## Set up Secure Enclave SSH and Git signing
	@echo "✓ SSH setup complete"

# Convenience aliases (alphabetized)
backup-key: /Volumes/ring/ssh/id_ed25519 ## Create backup key on ring.dmg

git-signing: $(HOME)/.ssh/allowed_signers ## Configure Git to use SSH signing

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

secure-enclave: $(HOME)/.ssh/id_ecdsa_sk_rk.pub ## Create Secure Enclave SSH key

# File targets - Make skips if file exists (alphabetized by target)
$(HOME)/.ssh/allowed_signers: $(HOME)/.ssh/id_ecdsa_sk_rk.pub
	@echo "Configuring Git SSH signing..."
	@bash $(CURDIR)/git-signing.sh

$(HOME)/.ssh/id_ecdsa_sk_rk.pub:
	@echo "Creating Secure Enclave SSH key..."
	@bash $(CURDIR)/secure-enclave.sh

/Volumes/ring/ssh/id_ed25519:
	@echo "Creating backup SSH key..."
	@bash $(CURDIR)/backup-key.sh

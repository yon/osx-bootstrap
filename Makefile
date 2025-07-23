.PHONY:	default
default: \
	brew \
	brew-bundle

.PHONY:	brew
brew:	/opt/homebrew/bin/brew

/opt/homebrew/bin/brew:
	@/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

.PHONY: brew-bundle
brew-bundle:	brew
	@curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/master/Brewfile | /opt/homebrew/bin/brew bundle install --file=-

.PHONY: brew-bundle-dump
brew-bundle-dump:	brew
	@/opt/homebrew/bin/brew bundle dump --file=$(CURDIR)/Brewfile --force

# Helper function to run preference script (local if available, remote otherwise)
define run-pref-script
	if [ -f $(CURDIR)/preferences/$(1) ]; then \
		echo "Running local $(1)..."; \
		bash $(CURDIR)/preferences/$(1); \
	else \
		echo "Running remote $(1)..."; \
		curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/master/preferences/$(1) | bash; \
	fi
endef

.PHONY: osx-preferences
osx-preferences:
	@echo "Applying macOS preferences..."
	@$(call run-pref-script,system.sh)
	@$(call run-pref-script,finder.sh)
	@$(call run-pref-script,safari.sh)
	@$(call run-pref-script,terminal.sh)
	@$(call run-pref-script,rectangle.sh)
	@echo "macOS preferences applied successfully!"

.PHONY: osx-preferences-local
osx-preferences-local:
	@echo "Applying macOS preferences from local files..."
	@bash $(CURDIR)/preferences/system.sh
	@bash $(CURDIR)/preferences/finder.sh
	@bash $(CURDIR)/preferences/safari.sh
	@bash $(CURDIR)/preferences/terminal.sh
	@bash $(CURDIR)/preferences/rectangle.sh
	@echo "Local preferences applied successfully!"

.PHONY: osx-preferences-remote
osx-preferences-remote:
	@echo "Applying macOS preferences from remote files..."
	@curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/master/preferences/system.sh | bash
	@curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/master/preferences/finder.sh | bash
	@curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/master/preferences/safari.sh | bash
	@curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/master/preferences/terminal.sh | bash
	@curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/master/preferences/rectangle.sh | bash
	@echo "Remote preferences applied successfully!"

# macOS Bootstrap

A comprehensive macOS setup script that automates the installation of development tools, applications, and system preferences.

## Quick Start

```bash
curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/master/Makefile | make -f - bootstrap
```

## What It Does

This bootstrap script will:

1. **Install Xcode Command Line Tools** - Essential development utilities
2. **Install Homebrew** - Package manager for macOS
3. **Install Applications & Tools** via Homebrew Bundle:
   - Development tools (Docker, Git, Node.js, Python, Go, Rust, Terraform)
   - Applications (1Password, Chrome, Slack, VS Code, Rectangle, etc.)
   - Mac App Store apps (Home Assistant, Okta Verify)
   - VS Code extensions for development

## Manual Installation

If you prefer to run locally:

```bash
# Clone the repository
git clone https://github.com/yon/osx-bootstrap.git
cd osx-bootstrap

# Run full bootstrap
make bootstrap

# See all available targets
make help
```

Run `make help` to see all available targets and their descriptions. Review the Makefile directly for implementation details and dependencies.

## Included Applications

See the [Brewfile](Brewfile) for the complete list of applications and tools that will be installed. The Brewfile includes development tools, productivity apps, communication tools, and various utilities.

## System Preferences

The bootstrap process can optionally configure macOS system preferences for Dock, Finder, Safari, Chrome, Terminal, and other applications. See the scripts in the [preferences/](preferences/) directory for details on what settings are modified.

To apply system preferences:

```bash
make osx-preferences
```

## Requirements

- macOS (tested on recent versions)
- Internet connection
- Administrator privileges (for some system preferences)

## Security Notes

- Review the scripts before running if security is a concern
- System preference changes require Full Disk Access for Terminal
- Some preferences may require restart to take effect

## Troubleshooting

### Homebrew & Package Installation
- If Homebrew installation fails, install manually first
- Run `brew doctor` if package installations fail
- For permission issues, ensure Terminal has Full Disk Access

## Contributing

1. Fork the repository
2. Make your changes
3. Test on a clean macOS installation
4. Submit a pull request

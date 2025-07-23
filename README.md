# macOS Bootstrap

A comprehensive macOS setup script that automates the installation of development tools, applications, and system preferences.

## Quick Start

```bash
curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/master/osx-bootstrap.sh | bash
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

If you prefer to run components individually:

```bash
# Clone the repository
git clone https://github.com/yon/osx-bootstrap.git
cd osx-bootstrap

# Install Homebrew packages only
make brew-bundle

# Apply macOS system preferences (optional)
make osx-preferences

# Update Brewfile with currently installed packages
make brew-bundle-dump
```

## Included Applications

### Development Tools
- Docker & Docker completion
- Git (via Xcode tools) & GitHub CLI
- Node.js, Python 3.12, Go, Rust
- Terraform, jq, direnv
- Visual Studio Code with extensions

### Applications
- **Productivity**: 1Password, Raycast, Rectangle
- **Communication**: Slack, Signal, Telegram, WhatsApp, Discord
- **Development**: Cursor, Charles Proxy
- **Creative**: Figma
- **AI Tools**: ChatGPT, Claude
- **Utilities**: Google Drive, iStat Menus

### Mac App Store Apps
- Home Assistant
- Okta Verify

## System Preferences

The script optionally configures macOS system preferences including:

- **Dock**: Auto-hide, magnification, show indicators
- **Finder**: Show extensions, path bar, status bar
- **Safari**: Developer tools, privacy settings
- **System**: Keyboard repeat rates, trackpad settings
- **Terminal**: Custom profile and settings
- **Rectangle**: Window management gap settings

### Skipping System Preferences

The default installation only installs packages. To apply system preferences:

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

- If Homebrew installation fails, install manually first
- For permission issues, ensure Terminal has Full Disk Access
- Run `brew doctor` if package installations fail

## Contributing

1. Fork the repository
2. Make your changes
3. Test on a clean macOS installation
4. Submit a pull request

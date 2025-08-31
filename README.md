# Personal Dotfiles

Custom configuration files for my Arch Linux + omarchy setup.

## 🎯 What's Tracked

This repo contains **only custom configurations** beyond the omarchy system defaults:

### Core Configs
- **`starship/`** - Custom shell prompt configuration
- **`nvim/`** - Complete Neovim setup with plugins and themes
- **`hypr/`** - Hyprland window manager configs (keybinds, autostart, etc.)
- **`walker/`** - App launcher configuration and custom themes
- **`swayosd/`** - On-screen display settings
- **`mise/`** - Development environment configuration

### Custom Themes
- **`omarchy/themes/rose-pine-dark/`** - Personal theme with wallpapers
- **`omarchy/current/`** - Current theme symlink
- **`btop/themes/`** - System monitor themes
- **`alacritty/`** - Terminal emulator configuration

## 🚀 Installation

1. **Install omarchy first** (provides base system)
2. **Clone this repo:**
   ```bash
   git clone <your-repo-url> ~/.config-backup
   ```
3. **Run the installation script:**
   ```bash
   cd ~/.config-backup
   ./install.sh
   ```
4. **Copy configs to ~/.config:**
   ```bash
   cp -r * ~/.config/
   ```

## 📦 Additional Software

The `install.sh` script installs packages beyond omarchy defaults:

### Development
- Neovim, Git, GitHub CLI
- Docker + Docker Compose
- LazyGit, LazyDocker
- AWS CLI, AWS VPN Client

### Productivity  
- 1Password (beta + CLI)
- Slack Desktop
- Obsidian, Typora, Zotero
- Printing support (CUPS)

### System Tools
- OpenCode (Claude CLI)
- APFS filesystem support
- Walker app launcher

## 🎨 Theme System

- **System themes:** `~/.local/share/omarchy/themes/` (built-in)
- **Custom themes:** `~/.config/omarchy/themes/` (this repo)
- **Current theme:** `~/.config/omarchy/current/` → points to active theme

## ⚡ Key Features

- **Minimal tracking** - Only actual customizations, no bloat
- **Security-focused** - Excludes sensitive files, caches, databases
- **Easy restoration** - Complete setup reproducible on new machines
- **Hyprland-optimized** - Full window manager configuration
- **Development-ready** - All tools for coding workflow

## 🔧 Structure

```
~/.config/
├── install.sh              # Package installation script
├── README.md               # This file
├── .gitignore              # Focused whitelist approach
├── starship/starship.toml  # Shell prompt
├── nvim/                   # Complete Neovim setup
├── hypr/                   # Hyprland window manager
├── walker/                 # App launcher + themes  
├── swayosd/                # OSD configuration
├── mise/                   # Dev environment
├── omarchy/
│   ├── current/            # Active theme link
│   └── themes/
│       └── rose-pine-dark/ # Custom theme
├── btop/themes/            # System monitor themes
└── alacritty/              # Terminal configuration
```

---
*This dotfiles setup is designed to work with [omarchy](https://github.com/omarchy/omarchy) - a complete Arch Linux desktop environment.*
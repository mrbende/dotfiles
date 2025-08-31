#!/bin/bash

# Dotfiles Installation Script
# Installs additional packages beyond omarchy system defaults

set -e  # Exit on any error

echo "🚀 Installing additional packages for dotfiles setup..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if running on Arch Linux
if ! command -v pacman &> /dev/null; then
    print_error "This script is designed for Arch Linux (pacman required)"
    exit 1
fi

# Update system first
print_status "Updating system packages..."
sudo pacman -Syu --noconfirm

# Development tools
print_status "Installing development tools..."
DEVELOPMENT_PACKAGES=(
    "neovim"           # Text editor
    "git"              # Version control
    "github-cli"       # GitHub CLI
    "docker"           # Containerization
    "docker-buildx"    # Docker build extensions
    "docker-compose"   # Docker orchestration
    "lazygit"          # Git TUI
    "nano"             # Simple text editor
)

sudo pacman -S --needed --noconfirm "${DEVELOPMENT_PACKAGES[@]}"

# Productivity applications
print_status "Installing productivity applications..."
PRODUCTIVITY_PACKAGES=(
    "1password-beta"   # Password manager (beta)
    "1password-cli"    # 1Password CLI
    "slack-desktop"    # Team communication
    "evince"           # PDF viewer
    "aws-cli"          # AWS command line
    "awsvpnclient"     # AWS VPN client
)

sudo pacman -S --needed --noconfirm "${PRODUCTIVITY_PACKAGES[@]}"

# System utilities
print_status "Installing system utilities..."
SYSTEM_PACKAGES=(
    "cups"             # Printing system
    "cups-filters"     # CUPS filters
    "cups-pdf"         # PDF printing
    "ufw-docker"       # Docker firewall rules
)

sudo pacman -S --needed --noconfirm "${SYSTEM_PACKAGES[@]}"

# Check if yay (AUR helper) is installed
if ! command -v yay &> /dev/null; then
    print_warning "yay AUR helper not found. Install it to get AUR packages:"
    echo "  git clone https://aur.archlinux.org/yay.git"
    echo "  cd yay && makepkg -si"
    echo ""
    echo "AUR packages to install manually:"
    echo "  - lazydocker-bin (Docker TUI)"
    echo "  - obsidian-bin (Note-taking)"
    echo "  - zotero-bin (Reference manager)"
    echo "  - apfs-fuse-git (macOS filesystem support)"
    echo "  - opencode (Claude Code CLI)"
    echo "  - typora (Markdown editor)"
    echo "  - walker-bin (App launcher)"
else
    print_status "Installing AUR packages..."
    AUR_PACKAGES=(
        "lazydocker-bin"   # Docker TUI
        "obsidian-bin"     # Note-taking app
        "zotero-bin"       # Reference manager
        "apfs-fuse-git"    # macOS filesystem support
        "opencode"         # Claude Code CLI
        "typora"           # Markdown editor
        "walker-bin"       # App launcher
    )
    
    yay -S --needed --noconfirm "${AUR_PACKAGES[@]}"
fi

# Enable and start services
print_status "Configuring services..."

# Enable Docker service
sudo systemctl enable docker.service
print_success "Docker service enabled"

# Enable CUPS for printing
sudo systemctl enable cups.service
sudo systemctl start cups.service
print_success "CUPS printing service enabled"

# Add user to docker group (requires logout/login to take effect)
if ! groups | grep -q docker; then
    sudo usermod -aG docker $USER
    print_warning "Added user to docker group. Please logout and login again for Docker access."
fi

print_success "✅ Installation complete!"
print_status "Additional setup notes:"
echo "  • Neovim config will be loaded from ~/.config/nvim/"
echo "  • Hyprland configs will be loaded from ~/.config/hypr/"
echo "  • Starship prompt config: ~/.config/starship/starship.toml"
echo "  • App launcher config: ~/.config/walker/config.toml"
echo "  • Custom theme: ~/.config/omarchy/themes/rose-pine-dark/"
echo ""
echo "🎉 Ready to use your dotfiles setup!"
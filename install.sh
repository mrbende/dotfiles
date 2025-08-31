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

# Core desktop applications
print_status "Installing core desktop applications..."
DESKTOP_PACKAGES=(
    "alacritty"        # Terminal emulator
    "chromium"         # Web browser
    "google-chrome"    # Chrome browser
    "nautilus"         # File manager
    "gnome-calculator" # Calculator
    "gimp"             # Image editor
    "mpv"              # Media player
    "imv"              # Image viewer
    "obs-studio"       # Recording/streaming
    "kdenlive"         # Video editor
    "pinta"            # Simple image editor
    "libreoffice-fresh" # Office suite
    "xournalpp"        # PDF annotation
)

sudo pacman -S --needed --noconfirm "${DESKTOP_PACKAGES[@]}"

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
    "clang"            # C/C++ compiler
    "npm"              # Node package manager
    "python-pip"       # Python package manager
    "python-pipx"      # Python app installer
    "python-virtualenv" # Python virtual environments
    "luarocks"         # Lua package manager
    "tree-sitter-cli"  # Parser generator
)

sudo pacman -S --needed --noconfirm "${DEVELOPMENT_PACKAGES[@]}"

# Communication & productivity
print_status "Installing communication & productivity applications..."
COMMUNICATION_PACKAGES=(
    "1password-beta"   # Password manager (beta)
    "1password-cli"    # 1Password CLI
    "slack-desktop"    # Team communication
    "signal-desktop"   # Secure messaging
    "zoom"             # Video conferencing
    "aws-cli"          # AWS command line
    "awsvpnclient"     # AWS VPN client
)

sudo pacman -S --needed --noconfirm "${COMMUNICATION_PACKAGES[@]}"

# System utilities & tools
print_status "Installing system utilities..."
SYSTEM_PACKAGES=(
    "cups"             # Printing system
    "cups-filters"     # CUPS filters
    "cups-pdf"         # PDF printing
    "system-config-printer" # Printer configuration
    "ufw"              # Firewall
    "ufw-docker"       # Docker firewall rules
    "bash-completion"  # Bash completions
    "bat"              # Better cat
    "eza"              # Better ls
    "fd"               # Better find
    "fzf"              # Fuzzy finder
    "ripgrep"          # Better grep
    "jq"               # JSON processor
    "tldr"             # Command help
    "tree-sitter-cli"  # Parser generator
    "wget"             # File downloader
    "unzip"            # Archive extractor
    "whois"            # Domain lookup
    "fastfetch"        # System info
    "btop"             # System monitor
    "brightnessctl"    # Brightness control
    "playerctl"        # Media control
    "pamixer"          # Audio mixer
    "gum"              # Script UI toolkit
    "zoxide"           # Smart cd
    "starship"         # Shell prompt
    "mise"             # Runtime manager
)

sudo pacman -S --needed --noconfirm "${SYSTEM_PACKAGES[@]}"

# Hyprland window manager & tools
print_status "Installing Hyprland ecosystem..."
HYPRLAND_PACKAGES=(
    "hyprland"         # Window manager
    "hyprlock"         # Screen locker
    "hypridle"         # Idle daemon
    "hyprshot"         # Screenshot tool
    "hyprpicker"       # Color picker
    "hyprsunset"       # Blue light filter
    "xdg-desktop-portal-hyprland" # Desktop portal
    "waybar"           # Status bar
    "mako"             # Notification daemon
    "swayosd"          # OSD daemon
    "swaybg"           # Wallpaper tool
    "wl-clipboard"     # Clipboard manager
    "wl-clip-persist"  # Clipboard persistence
    "wl-screenrec"     # Screen recorder
    "slurp"            # Area selector
    "satty"            # Screenshot editor
)

sudo pacman -S --needed --noconfirm "${HYPRLAND_PACKAGES[@]}"

# Fonts & themes
print_status "Installing fonts and themes..."
FONTS_THEMES_PACKAGES=(
    "noto-fonts"       # Google Noto fonts
    "noto-fonts-cjk"   # CJK fonts
    "noto-fonts-emoji" # Emoji fonts
    "noto-fonts-extra" # Extra Noto fonts
    "ttf-cascadia-mono-nerd" # Cascadia Code Nerd Font
    "ttf-jetbrains-mono" # JetBrains Mono
    "ttf-ia-writer"    # iA Writer fonts
    "woff2-font-awesome" # Font Awesome
    "gnome-themes-extra" # GTK themes
    "yaru-icon-theme"  # Ubuntu Yaru icons
    "kvantum-qt5"      # Qt themes
)

sudo pacman -S --needed --noconfirm "${FONTS_THEMES_PACKAGES[@]}"

# Audio/Video & multimedia
print_status "Installing multimedia packages..."
MULTIMEDIA_PACKAGES=(
    "pipewire"         # Audio server
    "pipewire-alsa"    # ALSA support
    "pipewire-jack"    # JACK support  
    "pipewire-pulse"   # PulseAudio support
    "wireplumber"      # Session manager
    "gst-plugin-pipewire" # GStreamer plugin
    "ffmpegthumbnailer" # Video thumbnails
    "imagemagick"      # Image manipulation
    "spotify"          # Music streaming
)

sudo pacman -S --needed --noconfirm "${MULTIMEDIA_PACKAGES[@]}"

# File management & integration
print_status "Installing file management tools..."
FILE_PACKAGES=(
    "gvfs-mtp"         # MTP device support
    "sushi"            # File previewer
    "gnome-keyring"    # Keyring management
    "polkit-gnome"     # Policy kit
    "xdg-desktop-portal-gtk" # GTK portal
)

sudo pacman -S --needed --noconfirm "${FILE_PACKAGES[@]}"

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
        "localsend-bin"    # File sharing
        "impala"           # Audio player
        "wiremix"          # Audio mixer
        "caligula"         # Database client
        "ollama"           # LLM runner
        "uwsm"             # Wayland session manager
        "plymouth"         # Boot splash
        "tzupdate"         # Timezone updater
        "zram-generator"   # ZRAM setup
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

# Enable UFW firewall
sudo systemctl enable ufw.service
sudo ufw --force enable
print_success "UFW firewall enabled"

# Enable bluetooth if available
if systemctl list-unit-files | grep -q bluetooth; then
    sudo systemctl enable bluetooth.service
    print_success "Bluetooth service enabled"
fi

# Add user to docker group (requires logout/login to take effect)
if ! groups | grep -q docker; then
    sudo usermod -aG docker $USER
    print_warning "Added user to docker group. Please logout and login again for Docker access."
fi

# Configure zoxide
if command -v zoxide &> /dev/null; then
    print_status "Setting up zoxide (smart cd)..."
    echo 'eval "$(zoxide init bash)"' >> ~/.bashrc 2>/dev/null || true
    echo 'eval "$(zoxide init zsh)"' >> ~/.zshrc 2>/dev/null || true
fi

# Configure mise (runtime manager)
if command -v mise &> /dev/null; then
    print_status "Setting up mise (runtime manager)..."
    echo 'eval "$(mise activate bash)"' >> ~/.bashrc 2>/dev/null || true
    echo 'eval "$(mise activate zsh)"' >> ~/.zshrc 2>/dev/null || true
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
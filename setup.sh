#!/bin/bash

# Create symbolic links
ln -sf $(pwd)/.tmux.conf ~/.tmux.conf
ln -sf $(pwd)/.zshrc ~/.zshrc
ln -sf $(pwd)/nvim ~/.config/nvim

# Install oh-my-zsh if not already installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo "Setup complete. Please restart your terminal."

#!/usr/bin/env bash

# macOS needs Git, Homebrew, and Stow
if [ "$(uname)" == "Darwin" ]
then
    # Get Command Line Tools
    xcode-select --install
    # Get Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # Install modern Git
    brew install git
    # Install modern Stow
    brew install stow
    # Install Fish shell
    brew install fish
    # Install macos-defaults
    brew install dsully/tap/macos-defaults
fi

# Clone dotfiles repo
git clone https://github.com/mmorella-dev/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# Stow dotfiles into home dir
stow -S --target=~/ home

# Apply macos defaults script
macos-defaults apply -vv ~/.dotfiles/data/macos-defaults/
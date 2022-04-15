#!/usr/bin/env bash

# Disable gatekeeper for all cask installs.
# This is slightly dangerous, so be careful when adding new casks to this file.
export HOMEBREW_CASK_OPTS="--no-quarantine"

brew install --cask firefox
brew install --cask iterm2
brew install --cask deezer
brew install --cask discord
brew install --cask vlc

# The Unarchiver
brew install --cask the-unarchiver

# Productivity
brew install --cask visual-studio-code
brew install --cask google-drive
brew install --cask typora

# Fonts
brew tap homebrew/cask-fonts
brew install --cask font-fira-code
brew install --cask font-cascadia
brew install --cask font-fira-code-nerd-font
brew install --cask font-hack
brew install --cask font-hasklig
brew install --cask font-monoid
brew install --cask font-roboto

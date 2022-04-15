#!/usr/bin/env bash

# Check if Homebrew is already installed.
command -v brew &> /dev/null;

if ! command -v brew &> /dev/null && [ "$(uname)" == "Darwin" ]; then
  read -rp "Homebrew is not currently installed. Would you like to install it? (y/n) " -n 1;
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    # Install Command-line Utils and Homebrew
    echo "Attempting to install Command Line Tools..."
    xcode-select --install
    echo "Attempting to install Homebrew..."
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh
    exit 1
  else
    echo "Exiting..."
    exit 1;
  fi;
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU Stow
brew install stow

# Install fish shell
brew install fish

# Switch to Fish shell
if ! grep -qF "${BREW_PREFIX}/bin/fish" /etc/shells; then
  which fish | sudo tee -a /etc/shells;
  chsh -s "$(which fish)";
fi;

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install fun utilities
brew install cowsay toilet figlet lolcat fortune cmatrix neofetch

# Install other useful binaries.
brew install ack
brew install git git-lfs neovim npm vbindiff

# Remove outdated formulae.
brew cleanup

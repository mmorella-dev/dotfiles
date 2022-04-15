# morellam-dev / dotfiles 
macOS and Linux dotfiles, managed with GNU Stow.

## Usage on macOS

1. Install Xcode Command Line Tools (needed for Git and Homebrew to work)
   ```sh
   xcode-select --install
   ```
1. Install [Homebrew](https://brew.sh/)
   ```sh
   bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   # when install completes, follow on-screen instructions to add `/.../homebrew/bin` to your $PATH
   ```
1. Install [GNU Stow](https://www.gnu.org/software/stow/)
   ```sh
   brew install stow
   ```
1. Clone this repository
   ```sh
   git clone https://github.com/morellam-dev/dotfiles.git ~/.dotfiles
   cd ~/.dotfiles/
   ```
1. Invoke Stow
   ```sh
   stow -VR .
   ```

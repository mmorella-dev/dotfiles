# UNIVERSAL VARIABLES
# ===================

# use zsh-style ls colors for both BSD and GNU ls
set -x LSCOLORS Gxfxcxdxbxegedabagacad
set -x LS_COLORS "di=1;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

# color palette inspired by zsh-syntax-highlighting 
# (use shell 16-colors rather than custom)
set fish_color_command green
set fish_color_error red --bold
set fish_color_autosuggestion brblack
set fish_color_comment brblack
set fish_color_escape magenta
set fish_color_quote yellow
set fish_color_normal white
set fish_color_end cyan
set fish_color_param white
set fish_color_operator blue
set fish_color_redirection white
set fish_color_selection cyan --background black
set fish_color_match --background brblue

# Homebrew init
# =============
if test -e /opt/homebrew/bin/brew
  eval "$(/opt/homebrew/bin/brew shellenv)"
end

# iTerm2 Shell Integrations
# =========================
test -e {$HOME}/.iterm2_shell_integration.fish; and source {$HOME}/.iterm2_shell_integration.fish

# Fisher (install if not installed)
# =================================
if not test -e $__fish_config_dir/functions/fisher.fish 
    curl -sL https://git.io/fisher | source
end

# PUT BINARIES IN PATH
# ====================

# Coreutils and findutils
fish_add_path -g "/usr/local/opt/coreutils/libexec/gnubin"
fish_add_path -g "/usr/local/opt/findutils/libexec/gnubin"

# Go tools
# ========
if command -q go
  fish_add_path -g (go env GOPATH)/bin
end

# Cargo
# =====
fish_add_path -g "$HOME/.cargo/bin"

# pyenv init
# ==========
if command -q pyenv
  pyenv init - | source
end

# use Starship prompt
# ===================
if command -q starship
  starship init fish | source
end

# Attempt to load SSH keys from macOS Keychain
# ============================================
ssh-add --apple-load-keychain &> /dev/null

# Conda initialize
if test -e /opt/homebrew/Caskroom/miniconda/base/bin/conda
  eval /opt/homebrew/Caskroom/miniconda/base/bin/conda "shell.fish" "hook" $argv | source
end

## GPG
export GPG_TTY=$(tty)

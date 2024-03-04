# Add Cargo to path
fish_add_path -g "$HOME/.cargo/bin"

# Only make aliases if session is interactive
if status --is-interactive
    
    # replace basic commands with rust
    if command --query bat
        alias cat bat
    end
    if command --query exa
        alias ls exa
    end
    if command --query rip # rm-improved
        alias rm rip
    end
    
    if command --query zoxide # zoxide
        zoxide init fish | source
        alias cd z
    end
    
    # cargo install exa bat rm-improved zoxide
    return 0
end
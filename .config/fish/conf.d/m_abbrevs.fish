# youtube-dl abbreviation
# ytdl -> youtube-dl
if command -q youtube-dl
  abbr -a -g ytdl youtube-dl 
end

# emacs games (just for fun)
if command -q emacs
    alias snake="emacs -f snake"
    alias pong="emacs -f pong"
    alias tetris="emacs -f tetris"
    alias bubbles="emacs -f bubbles"
end

if command -q neofetch
  # neofetch shortcuts
  alias lionfetch="neofetch --config $HOME/.config/neofetch/lionfetch.conf"
  alias cyberfetch="neofetch --config $HOME/.config/neofetch/cyberfetch.conf"
end

# kill all background jobs
abbr -a -g killj 'kill (jobs -p)'

if command -q grep
  abbr -a -g grepi 'grep -i'
end
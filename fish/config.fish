alias vim "nvim"
alias ls "exa"

# Get rid of the fish greeting message
set fish_greeting

# Setting the cargo bin to the front of the path variable
# so cargo defaults to the rustup cargo and not the one
# managed by pacman and other packages.
set -x --prepend PATH ~/.cargo/bin

# Use vim as the default editor
set EDITOR nvim 
set VISUAL nvim

# Auto start tmux
if status is-interactive
and not set -q TMUX
    exec tmux
end


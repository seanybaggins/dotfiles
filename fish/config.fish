alias vim "nvim"
alias ls "exa"
alias k "kubectl"
alias cat "bat"

# Get rid of the fish greeting message
set fish_greeting

# Setting the cargo bin to the front of the path variable
# so cargo defaults to the rustup cargo and not the one
# managed by pacman and other packages.
set -x --prepend PATH ~/.cargo/bin

# Use vim as the default editor
set -x EDITOR nvim 
set -x VISUAL nvim

# Auto start sway at login
if test -z "$DISPLAY" && test (tty) = "/dev/tty1"
    exec sway
end

# Auto start tmux
if status is-interactive
and not set --query TMUX
    exec tmux
end

# Add the gem home to path variable so I can use jekyll and other ruby gems
# Modified from https://wiki.archlinux.org/title/Ruby#RubyGems
if command --search ruby > /dev/null
    set --export GEM_HOME (ruby -e 'puts Gem.user_dir')
    set --export --append PATH "$GEM_HOME/bin"
end

# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
end


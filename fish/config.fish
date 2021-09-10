alias vim "nvim"
alias ls "exa"
alias cat "bat"
alias xclip "xclip -selection c"

# So tmux will load with 256 range colors
alias tmux "tmux -2"

# Get rid of the fish greeting message
set fish_greeting

# Setting the cargo bin to the front of the path variable
# so cargo defaults to the rustup cargo and not the one
# managed by pacman and other packages.
set --export --prepend PATH ~/.cargo/bin

# Use vim as the default editor
set --export EDITOR nvim 
set --export VISUAL nvim

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
# https://github.com/chriskempson/base16-shell
if status --is-interactive
  set --export BASE16_SHELL "$HOME/.config/base16-shell"
  source "$BASE16_SHELL/profile_helper.fish"
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /opt/anaconda/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<


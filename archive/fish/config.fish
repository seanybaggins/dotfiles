alias vim "nvim"
alias ls "exa"
alias cat "bat"
alias xclip "xclip -selection c"
alias py-debug "python -m pudb"

# So tmux will load with 256 range colors
alias tmux "tmux -2"

# Get rid of the fish greeting message
set fish_greeting

# Use vim as the default editor
set --export EDITOR nvim 
set --export VISUAL nvim

# So fish knows where to look for local binaries when not on arch
set --export --append PATH ~/.cargo/bin
set --export --append PATH ~/.local/bin

# Auto start tmux
if status --is-interactive
and not set --query TMUX
    exec tmux
end

# Helper functions for navigating open andriod projects
function setcdr
    if not test -d $PWD/.repo;
        echo "No such file or directory $PWD/.repo"
        return 1
    end
    echo "Setting CDR=$PWD"
    set --global CDR $PWD
end

function cdr
    if not set --query CDR;
        echo '$CDR not set'
        return 1
    end
    cd "$CDR/$argv"
end

function cdks
    cdr "vendor/nxp-opensource/kernel_imx/$argv"
end

function cdbs
    cdr "vendor/nxp-opensource/uboot-imx/$argv"
end

function cdd
    if test -d "$CDR/device/nxp/imx8m";
        set CDD "$CDR/device/nxp/imx8m"
    else
        set CDD "$CDR/device/fsl"
    end
    # Specail characters for color coding
    # https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
    echo -e "\e[1;33mWarning: \e[0m TARGET_PRODUCT hardcoded to ackg3 in fish"
    cd "$CDD/ackg3/$argv"
end

function cdpo
    echo -e "\e[1;33mWarning: \e[0m TARGET_PRODUCT hardcoded to ackg3 in fish"
    cdr "out/target/product/ackg3/$argv"
end

function cdko
    cdpo "obj/KERNEL_OBJ/$argv"
end

function cdbo
    cdpo "obj/UBOOT_OBJ/$argv"
end

function cdm
    cdr "vendor/hnt/manufacturing/$argv"
end

function cdf
    cdr "vendor/hnt/factory_test/$argv"
end

# Add the gem home to path variable so I can use jekyll and other ruby gems
# Modified from https://wiki.archlinux.org/title/Ruby#RubyGems
if command --search ruby > /dev/null
    set --export GEM_HOME (ruby -e 'puts Gem.user_dir')
    set --export --append PATH "$GEM_HOME/bin"
end

if status --is-interactive 
and command --search neofetch > /dev/null
    neofetch
end

# Base16 Shell
# https://github.com/chriskempson/base16-shell
if status --is-interactive
  set --export BASE16_SHELL "$HOME/.config/base16-shell"
  source "$BASE16_SHELL/profile_helper.fish"
end

# Better syntax highlighting in man pages
# Requires bat package
# https://github.com/sharkdp/bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"



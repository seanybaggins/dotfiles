# Run neofetch if it exists. Super useful for getting the status info of a 
# device
if [ -x "$(command -v neofetch)" ] && [ -n "${TMUX}" ]; then
    neofetch
fi

# Base16 Shell
BASE16_SHELL="$HOME/dotfiles/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# ~/.zshrc
if [ -e /home/sean/.nix-profile/etc/profile.d/nix.sh ]; then . /home/sean/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# if tmux is executable and not inside a tmux session, then try to attach.
# if attachment fails, start a new session
# source: https://wiki.archlinux.org/title/tmux#Start_tmux_on_every_shell_login
[ -x "$(command -v tmux)" ] \
    && [ -z "${TMUX}" ] \
    && { tmux -2 attach || tmux -2; } >/dev/null 2>&1

# Not sure why .local/bin is not on the path by default
PATH+=:~/.local/bin

# Add any functions that may be useful
source "$HOME/dotfiles/zsh/.zfuncs/setcdr"

if [ -d ~/g3aosp11 ]; then
    cd ~/g3aosp11
    setcdr
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.zsh_plugins.sh

# Alias's
alias vim="nvim"
alias ls="exa"
alias la="exa -lah"
alias cat="bat"
alias xclip="xclip -selection c"
alias py-debug="python -m pudb"

# So tmux will load with 256 range colors
alias tmux="tmux -2"

# Better syntax highlighting in man pages
# Requires bat package
# https://github.com/sharkdp/bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export EDITOR=nvim
export VISUAL=nvim

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

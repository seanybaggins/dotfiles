# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ~/.zshrc
if [ -e /home/sean/.nix-profile/etc/profile.d/nix.sh ]; then . /home/sean/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# if tmux is executable and not inside a tmux session, then try to attach.
# if attachment fails, start a new session
# source: https://wiki.archlinux.org/title/tmux#Start_tmux_on_every_shell_login
[ -x "$(command -v tmux)" ] \
    && [ -z "${TMUX}" ] \
    && { tmux attach || tmux; } >/dev/null 2>&1

source ~/.zsh_plugins.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

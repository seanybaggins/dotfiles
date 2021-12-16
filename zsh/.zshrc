# ~/.zshrc
if [ -e /home/sean/.nix-profile/etc/profile.d/nix.sh ]; then . /home/sean/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
source ~/.zsh_plugins.sh
antigen theme romkatv/powerlevel10k


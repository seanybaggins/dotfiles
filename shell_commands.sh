#!/bin/bash
echo "Installing nix"
curl -L https://nixos.org/nix/install | sh

echo "Sourcing nix"
source ~/.nix-profile/etc/profile.d/nix.sh

echo "Installing packges"
xargs -d '\n' -- nix-env -iA < packages.txt

echo "Adding nix zshell to list of valid shells"
command -v zsh | sudo tee -a /etc/shells

echo "Changing shell"
sudo chsh -s $(which zsh) $USER

echo "Installing shell pluggins"
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

echo "Installing vim-plug"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo "Installing nvim pluggins"
nvim +PlugUpgrade +PlugInstall +PlugUpdate +qa

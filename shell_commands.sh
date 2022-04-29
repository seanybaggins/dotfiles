#!/bin/bash
echo
echo "Installing nix"
echo "=============="
curl -L https://nixos.org/nix/install | sh

echo
echo "Sourcing nix"
echo "============"
source ~/.nix-profile/etc/profile.d/nix.sh

echo
echo "Installing packges"
echo "=================="
xargs -d '\n' -- nix-env -iA < packages.txt

echo
echo "Adding nix zshell to list of valid shells"
echo "========================================="
command -v zsh | sudo tee -a /etc/shells

echo
echo "Changing shell"
echo "=============="
sudo chsh -s $(which zsh) $USER

echo
echo "Installing shell pluggins"
echo "========================="
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

echo
echo "Installing vim-plug"
echo "==================="
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo 
echo "Installing nvim pluggins"
echo "========================"
nvim +PlugUpgrade +PlugInstall +PlugUpdate +qa

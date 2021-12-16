#!/bin/bash
echo "Installing nix"
curl -L https://nixos.org/nix/install | sh

echo "Sourcing nix"
source ~/.nix-profile/etc/profile.d/nix.sh

echo "Installing packges"
xargs -d '\n' -- nix-env -iA < packages.txt

echo "Changing shell"
chsh -s $(which zsh)

echo "Installing nvim pluggins"
nvim +PlugUpgrade +PlugInstall +PlugUpdate

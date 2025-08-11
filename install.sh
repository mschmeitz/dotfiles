#!/bin/bash

# copy dotfiles into ~/
shopt -s dotglob # include . in *
shopt -s extglob
yes | cp -rf ~/dotfiles/!(.git|.|..|.local) ~

# Add GitHub as a known host
echo "adding GitHub as a known host"
ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts

# Install starship.rs
echo "installing starship"
# Install Starship
sh -c "$(curl -fsSL https://starship.rs/install.sh)" -y -f

# Install fonts
cp ~/dotfiles/fonts /usr/share/fonts

echo "installing extensions..."
if [[ -f "settings.json" ]] 
then
    # Install extensions & set VSCode prefs
    /var/tmp/coder/code-server/bin/code-server --install-extension file-icons.file-icons
    /var/tmp/coder/code-server/bin/code-server --install-extension streetsidesoftware.code-spell-checker
    /var/tmp/coder/code-server/bin/code-server --install-extension HashiCorp.terraform
    cp -f ~/dotfiles/settings.json /home/coder/.local/share/code-server/User/settings.json
fi

# Install fish & make it default shell
echo "installing fish shell"
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt-get install -y fish

echo "changing shell"
sudo chsh -s /usr/bin/fish $USER


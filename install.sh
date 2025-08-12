#!/bin/bash

# copy dotfiles into ~/
#x shopt -s dotglob # include . in *
#x shopt -s extglob
#x yes | cp -rf ~/dotfiles/!(.git|.|..|.local) ~

# Add GitHub as a known host
#x echo "adding GitHub as a known host"
#x ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts

# Install starship.rs
#x echo "installing starship"
# Install Starship
#x sh -c "$(curl -fsSL https://starship.rs/install.sh)" -y -f

# Install fonts
#x cp ~/dotfiles/fonts /usr/share/fonts

echo "installing extensions..."
if [[ -f "settings.json" ]] 
then
    # Install extensions & set VSCode prefs
    /var/tmp/coder/code-server/bin/code-server --install-extension file-icons.file-icons
#x    /var/tmp/coder/code-server/bin/code-server --install-extension streetsidesoftware.code-spell-checker
    /var/tmp/coder/code-server/bin/code-server --install-extension HashiCorp.terraform
    cp -f ~/dotfiles/settings.json /home/coder/.local/share/code-server/User/settings.json
fi

# Install fish & make it default shell
echo "installing fish shell"
#x sudo apt-add-repository ppa:fish-shell/release-3
#x sudo apt update
#x sudo apt-get install -y fish

echo "changing shell"
#x sudo chsh -s /usr/bin/fish $USER
touch ~/dotfile_creation

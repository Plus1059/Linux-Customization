#!/bin/bash

echo 'Setting Resolution'

xrandr --newmode "2560x1440_60.00"  311.83  2560 2744 3024 3488  1440 1441 1444 1490  -HSync +Vsync
xrandr --addmode Virtual-1 "2560x1440_60.00"
xrandr --output Virtual-1 --mode "2560x1440_60.00"

echo 'Installing Nala'

echo "deb http://deb.volian.org/volian/ scar main" | sudo tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list
wget -qO - https://deb.volian.org/volian/scar.key | sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg > /dev/null
sudo apt update
sudo apt install nala -y

echo 'Updating System'

sudo nala update
sudo nala upgrade -y

echo 'Setting up customizations'

sudo nala install terminator
sudo nala install zsh
sudo usermod --shell /bin/zsh $(whoami)
sudo git clone https://github.com/zsh-users/zsh-autosuggestions /usr/share
sudo git git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /usr/share
mv .zshrc_Parrot_OS ~/.zshrc
sudo mkdir ~/.config/terminator/config
sudo mv config ~/.config/terminaor/config
mv kali-ascii-green.png ~/Pictures

echo 'Installing Sublime-Text'

sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo nala config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
sudo nala install sublime-text

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

wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo nala update
sudo nala install sublime-text

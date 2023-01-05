#!/bin/bash

ec="\e[0m" # End Color
g="\e[32m" # Green
bg="\e[1;32m" # Bold Green
bug="\e[1;4;32m" # Bold Underlined Green
iw="\e[3;97m" # Italic White
m="\e[95m" # Magenta
c="\e[96m" # Cyan

echo -e "${bg} ▄▄▄▄▄▄▄ ▄▄   ▄▄ ▄▄▄▄▄▄▄    ▄▄   ▄▄ ▄▄▄▄▄▄ ▄▄   ▄▄ ▄▄▄▄▄▄ ▄▄   ▄▄ 
█       █  █ █  █       █  █  █ █  █      █  █ █  █      █  █ █  █
█   ▄   █  █▄█  █   ▄   █  █  █▄█  █  ▄   █  █▄█  █  ▄   █  █▄█  █
█  █▄█  █       █  █ █  █  █       █ █▄█  █       █ █▄█  █       █
█       █▄     ▄█  █▄█  █  █   ▄   █      █   ▄   █      █   ▄   █
█   ▄   █ █   █ █       █  █  █ █  █  ▄   █  █ █  █  ▄   █  █ █  █
█▄▄█ █▄▄█ █▄▄▄█ █▄▄▄▄▄▄▄█  █▄▄█ █▄▄█▄█ █▄▄█▄▄█ █▄▄█▄█ █▄▄█▄▄█ █▄▄█${ec}

			${g}░█▄▀▒▄▀▄░█▒░░█
			░█▒█░█▀█▒█▄▄░█${ec}"

echo -e "${bg}Setting Resolution${ec}"

#xrandr --newmode "2560x1440_60.00"  311.83  2560 2744 3024 3488  1440 1441 1444 1490  -HSync +Vsync
#xrandr --addmode Virtual-1 "2560x1440_60.00"
#xrandr --output Virtual-1 --mode "2560x1440_60.00"

echo -e "${bg}Installing Nala${ec}"

#echo "deb http://deb.volian.org/volian/ scar main" | sudo tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list
#wget -qO - https://deb.volian.org/volian/scar.key | sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg > /dev/null
#sudo apt update
#sudo apt install nala -y

echo -e "${bg}Setting up customizations${ec}"

#sudo nala install terminator -y
#sudo nala install zsh -y
#mv .zshrc_Parrot_OS ~/.zshrc
#sudo mkdir ~/.config/terminator
#sudo mv config ~/.config/terminaor/config
#mv kali-ascii-green.png ~/Pictures

echo -e "${bg}Installing Sublime-Text${ec}"

#wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
#echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
#sudo nala update
#sudo nala install sublime-text -y

echo -e "${bg}Updating System${ec}"

#sudo nala update
#sudo nala upgrade -y

echo -e "${bg}Installing Gimp${ec}"

sudo nala install gimp -y

echo -e "${bug}Icon theme:${ec}
${g}https://store.kde.org/p/1333360${ec}
${iw}Material-Black-Lime-Numix-FLAT${ec}"

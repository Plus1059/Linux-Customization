#!/bin/bash

ec="\e[0m" # End Color
g="\e[32m" # Green
bg="\e[1;32m" # Bold Green
bug="\e[1;4;32m" # Bold Underlined Green
iw="\e[3;97m" # Italic White
m="\e[95m" # Magenta
c="\e[96m" # Cyan

echo "${bg}Setting up customizations${ec}"

sudo dnf install terminator
sudo dnf install zsh
sudo usermod --shell /bin/zsh $(whoami)
sudo git clone https://github.com/zsh-users/zsh-autosuggestions /usr/share/zsh-autosuggestions
sudo git git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /usr/share/zsh-syntax-highlighting
mv .zshrc_Parrot_OS ~/.zshrc
sudo mkdir ~/.config/terminator/
sudo mv config ~/.config/terminaor/config

echo "${bg}Updating System${ec}"

sudo dnf update
sudo dnf upgrade

echo "${bg}Installing qemu${ec}"

sudo dnf group install --with-optional virtualization
sudo systemctl start libvirtd
sudo systemctl enable libvirtd

echo "${bg}Installing Sublime-Text${ec}"

sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
sudo dnf install sublime-text

echo "${bg}Installing Timeshift${ec}"

sudo dnf install timeshift

echo "${bg}Setting up RPMFusion${ec}"

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf groupupdate core

echo "${bg}Setting up Multimedia${ec}"

sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf groupupdate sound-and-video

echo "${bg}Setting up Flatpak${ec}"

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "${bg}Installing Firefox theme${ec}"
# https://github.com/rafaelmardojai/firefox-gnome-theme

curl -s -o- https://raw.githubusercontent.com/rafaelmardojai/firefox-gnome-theme/master/scripts/install-by-curl.sh | bash

echo "${bug}Make it look pretty${ec}
${iw}Install ${ec}${g}Gnome Tweaks${ec}
${iw}Install ${ec}${g}Extension Manager${ec}

${bg}In Extension Manager Install:${ec}
${iw}Install ${ec}${g}User Themes${ec}${iw}
Install ${ec}${g}Dash to Dock${ec}${iw}
Install ${ec}${g}Blur my Shell${ec}${iw}
Install ${ec}${g}Vitals${ec}

${bg}Theme and Icons${ec}
${ec}${g}https://github.com/vinceliuice/Orchis-theme${ec}${iw} ${c}#Theme${ec}${iw}
  -requires gnome-themes-extra gtk-murrine-engine and sassc${ec}
    ${c}sudo dnf install gnome-themes-extra gtk-murrine-engine and sassc -y${ec}
${g}https://github.com/vinceliuice/Colloid-icon-theme${ec}${iw} ${c}#Icons${ec}${iw}"

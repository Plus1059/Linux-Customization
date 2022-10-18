#!/bin/bash


echo 'Updating System'

sudo dnf update

sudo dnf upgrade

echo 'Installing qemu'

sudo dnf group install --with-optional virtualization

sudo systemctl start libvirtd

sudo systemctl enable libvirtd

echo 'Setting up customizations'

sudo dnf install terminator

sudo dnf install zsh

sudo usermod --shell /bin/zsh $(whoami)

sudo git clone https://github.com/zsh-users/zsh-autosuggestions /usr/share

sudo git git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /usr/share

mv .zshrc_Parrot_OS ~/.zshrc

sudo mkdir ~/.config/terminator/config

sudo mv config ~/.config/terminaor/config

echo 'Installing Sublime-Text'

sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg

sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo

sudo dnf install sublime-text

echo 'Installing Timeshift'

sudo dnf install timeshift

echo 'Setting up RPMFusion'

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf groupupdate core

echo 'Setting up Multimedia'

sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin

sudo dnf groupupdate sound-and-video

echo 'Setting up Flatpak'

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
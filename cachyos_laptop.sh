#!/bin/bash

# 1. Sistem depolarını yeniler ve tüm sistemi günceller
sudo pacman -Syyu --noconfirm

# 2. Yay (AUR) kurmak için gerekli temel araçları ve git'i yükler
sudo pacman -S --needed base-devel git --noconfirm

# 3. Belirttiğin gereksiz uygulamaları ve bağımlılıklarını kaldırır
sudo pacman -Rcs micro parole meld --noconfirm

# 4. İstediğin tüm resmi depo uygulamalarını yükler
sudo pacman -S fastfetch ntfs-3g vlc gparted flatpak xfce4-docklike-plugin firefox evince kolourpaint papirus-icon-theme wine winetricks flameshot localsend --noconfirm

# 5. Ev dizininde git klasörü oluşturur, yay'ı klonlar ve derleyerek kurar
mkdir -p ~/git && cd ~/git
git clone https://aur.archlinux.org/yay
cd yay
makepkg -si --noconfirm
cd ~

# 6. AUR üzerinden uygulamaları kurar.
yay -S rustdesk-bin onlyoffice-bin bibata-cursor-theme-bin mint-themes grub-customizer helium-browser-bin --noconfirm

# 7. Zapret kurulum betiğini indirir ve çalıştırır
curl -fsSL https://raw.github.com/keift/zapret/refs/heads/main/src/install.sh | sudo bash

echo "Tüm işlemler başarıyla tamamlandı!"

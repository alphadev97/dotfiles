#!/bin/bash

# Update Flatpak and system (optional but recommended)
sudo flatpak update -y
sudo dnf update -y

# Install Flatpak applications
flatpak install -y flathub com.brave.Browser
flatpak install -y flathub io.github.shiftey.Desktop
flatpak install -y flathub com.getpostman.Postman
flatpak install -y flathub rest.insomnia.Insomnia
flatpak install -y flathub com.mongodb.Compass
flatpak install -y flathub us.zoom.Zoom
flatpak install -y flathub com.discordapp.Discord
flatpak install -y flathub org.qbittorrent.qBittorrent
flatpak install -y flathub org.videolan.VLC

# Print completion message
echo "All applications have been installed successfully!"

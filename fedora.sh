#!/bin/bash
set -e  # Exit immediately if any command fails

echo "========================================"
echo "FEDORA SETUP SCRIPT"
echo "========================================"

# Configure dnf for faster performance
echo "========================================"
echo "Configuring dnf for faster performance..."
echo "========================================"

if ! grep -q "fastestmirror=True" /etc/dnf/dnf.conf; then
    sudo bash -c 'cat >> /etc/dnf/dnf.conf <<EOF
fastestmirror=True
max_parallel_downloads=10
defaultyes=True
keepcache=True
EOF'
fi

sudo dnf clean all
sudo dnf makecache

echo "========================================"
echo "dnf configuration updated successfully!"
echo "========================================"

# Update and upgrade the system
echo "========================================"
echo "Updating system..."
echo "========================================"

sudo dnf update -y

echo "========================================"
echo "System updated successfully"
echo "========================================"

# RPM Fusion for packages: To enable access to both the free and the nonfree repository
echo "========================================"
echo "RPM Fusion: To enable access to both the free and the nonfree repository"
echo "========================================"

sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

echo "========================================"
echo "AppStream Metadata Update"
echo "========================================"

sudo dnf update -y @core

echo "========================================"
echo "Installing FlatHub"
echo "========================================"

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Install Zsh and set it as the default shell
echo "========================================"
echo "Installing Zsh and setting it as the default shell..."
echo "========================================"

sudo dnf install -y zsh
chsh -s $(which zsh)

# Install Oh My Zsh
echo "========================================"
echo "Installing Oh My Zsh..."
echo "========================================"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install Powerlevel10k theme
echo "========================================"
echo "Installing Powerlevel10k theme..."
echo "========================================"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i 's/ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

# Install Go (Golang)
echo "========================================"
echo "Installing Go (Golang)..."
echo "========================================"

GO_VERSION="1.21.0"  # Replace with the latest version if needed
GO_TAR="go${GO_VERSION}.linux-amd64.tar.gz"
GO_URL="https://go.dev/dl/${GO_TAR}"

# Download and install Go
wget -q ${GO_URL} -O /tmp/${GO_TAR}
sudo tar -C /usr/local -xzf /tmp/${GO_TAR}
rm /tmp/${GO_TAR}

# Set Go environment variables in .zshrc
echo "========================================"
echo "Setting up Go environment variables..."
echo "========================================"

cat >> ~/.zshrc <<EOF
# Go environment variables
export PATH=\$PATH:/usr/local/go/bin
export GOPATH=\$HOME/go
export PATH=\$PATH:\$GOPATH/bin
EOF

# Install NVM and Node.js
echo "========================================"
echo "Installing NVM and Node.js..."
echo "========================================"

# Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash

# Load NVM in the current shell
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Install Node.js (e.g., version 21)
nvm install 21

# Verify Node.js and npm installation
echo "========================================"
echo "Verifying Node.js and npm installation..."
echo "========================================"

node -v
nvm current
npm -v

# Update .zshrc to load NVM automatically
echo "========================================"
echo "Updating .zshrc to load NVM automatically..."
echo "========================================"

cat >> ~/.zshrc <<EOF
# NVM configuration
export NVM_DIR="\$HOME/.nvm"
[ -s "\$NVM_DIR/nvm.sh" ] && \. "\$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "\$NVM_DIR/bash_completion" ] && \. "\$NVM_DIR/bash_completion"  # This loads nvm bash_completion
EOF

# Reload Zsh
echo "========================================"
echo "Reloading Zsh..."
echo "========================================"

exec zsh

# Completion message
echo "========================================"
echo "Fedora setup complete! Restart your system & Enjoy."
echo "========================================"

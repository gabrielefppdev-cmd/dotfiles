#!/bin/sh
set -eu

apt update
apt install -y make gcc ripgrep fd-find tree-sitter-cli unzip git xclip wl-clipboard nodejs npm curl

# Now we install nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
rm -rf /opt/nvim-linux-x86_64
mkdir -p /opt/nvim-linux-x86_64
chmod a+rX /opt/nvim-linux-x86_64
tar -C /opt -xzf nvim-linux-x86_64.tar.gz

# make it available in /usr/local/bin, distro installs to /usr/bin
ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/

#!/bin/sh
set -eu

apt-get update
apt-get install -y software-properties-common
add-apt-repository ppa:neovim-ppa/unstable -y
apt-get update
apt-get install -y make gcc ripgrep fd-find tree-sitter-cli unzip git xclip wl-clipboard nodejs npm neovim

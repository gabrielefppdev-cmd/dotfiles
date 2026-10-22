#!/bin/sh
set -eu

pacman -Syu --noconfirm --needed gcc make git ripgrep fd tree-sitter-cli unzip xclip wl-clipboard nodejs npm neovim


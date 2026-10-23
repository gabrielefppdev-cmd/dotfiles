#!/bin/sh
set -eu

. /etc/os-release

case "$ID" in
  ubuntu) sh ./pkg-ubuntu.sh ;;
  debian) sh ./pkg-debian.sh ;;
  arch)   sh ./pkg-arch.sh ;;
  alpine) sh ./pkg-alpine.sh ;;
  *)
    echo "Distro not supported: $ID - supported distro: arch, alpine, debian, ubuntu"
    exit 1
    ;;
esac

mkdir -p "$_REMOTE_USER_HOME/.config"
git clone https://github.com/gabrielefppdev-cmd/dotfiles.nvim "$_REMOTE_USER_HOME/.config/nvim"
chown -R "$_REMOTE_USER" "$_REMOTE_USER_HOME/.config"

sh ./lsp.sh

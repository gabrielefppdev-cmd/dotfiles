#!/bin/sh
set -eu

apk add --no-cache gcc make git fd ripgrep tree-sitter-cli unzip gzip curl musl-dev xclip wl-clipboard nodejs npm
apk add --no-cache neovim neovim-doc \
  --repository=https://dl-cdn.alpinelinux.org/alpine/edge/main \
  --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community

#!/bin/sh
set -eu

. /etc/os-release
TOOLS="stylua json-lsp yaml-language-server prettier"

# Alpine and Mason lua-language-server don't work well together.
# This code installs it from apk instead.
if [ "$ID" = "alpine" ]; then
  apk add --no-cache lua-language-server
else
  TOOLS="$TOOLS lua-language-server"
fi

if [ "$WEB" = "true" ]; then
  TOOLS="$TOOLS typescript-language-server css-lsp html-lsp"
fi

if [ "$PYTHON" = "true" ]; then
  TOOLS="$TOOLS pyright ruff"
  case "$ID" in
    ubuntu) apt-get install -y python3 python3-venv python3-pip ;;
    arch)   pacman -S --noconfirm --needed python python-pip ;;
    alpine) apk add --no-cache python3 py3-pip ;;
  esac
fi

su - "$_REMOTE_USER" -c "nvim --headless -c 'MasonInstall $TOOLS' -c 'qall'"

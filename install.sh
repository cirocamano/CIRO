#!/usr/bin/env bash
set -euo pipefail

CIRO_BIN="${CIRO_BIN:-$HOME/bin}"
SRC_BIN="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/dist/ciro"
TARGET_BIN="${CIRO_BIN%/}/ciro"

if [[ ! -x "$SRC_BIN" ]]; then
  echo "No se encontro el binario en $SRC_BIN"
  echo "Primero generarlo con PyInstaller y renombrarlo a dist/ciro"
  exit 1
fi

mkdir -p "$CIRO_BIN"
cp "$SRC_BIN" "$TARGET_BIN"
chmod +x "$TARGET_BIN"

echo "Instalado: $TARGET_BIN"
echo "Si ~/bin no esta en tu PATH, agrega en ~/.zshrc:"
echo "  export PATH=\"$HOME/bin:\$PATH\""

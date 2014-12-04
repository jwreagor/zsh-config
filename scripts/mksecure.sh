#!/usr/bin/env zsh

echo "Creating secure fs"
hdiutil create \
  -autostretch \
  -attach \
  -stdinpass \
  -encryption AES-256 \
  -size 500m \
  -fs HFS+ \
  -volname ${1:-secure_disk} \
  ~/Desktop/${1:-secure_disk}

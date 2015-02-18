#!/usr/bin/env zsh

local __name=${1:-secure_disk}
local __file=${__name}.dmg
local __size=500m
local __enc=AES-256
local __fs=HFS+
local __path=~/Desktop/${__name}
local __dmg=~/Desktop/${__file}
local __mnt=/Volumes/${__name}

echo "Creating encrypted FS \"$__dmg\""
echo

hdiutil create \
  -autostretch \
  -attach \
  -stdinpass \
  -encryption $__enc \
  -size $__size \
  -fs $__fs \
  -volname $__name \
  $__path

if [ -d $__mnt ]; then
  echo
  echo "Mounted at \"$__mnt\""
  cd $__mnt
fi


#!/usr/bin/env zsh

autoload colors && colors

_nfo_="all the checksums"
_ver_="v0.1.0"
_prg_="%{$fg_bold[blue]%}$(basename $0)%{$reset_color%}"
_cpy_="$_ver_ -- (c) 2014 Copyright, Justin Reagor <cheapRoc> BSD"

for file in $*; do
  if [ -f $file ]; then
    __file_size="$(command ls -l $file | cut -d ' ' -f 7)"
    __file_hsize="$(command ls -lh $file | cut -d ' ' -f 8)"
    __file_md5="$(md5 $file | cut -d ' ' -f 4)"
    __file_sha1sum="$(shasum $file | cut -c 1-40)"
    __file_sha256sum="$(openssl dgst -sha256 $file | cut -d ' ' -f 2)"

    echo "${fg_bold[blue]}$file${reset_color}"
    echo "hsize:\t\t${fg_bold[green]}$__file_hsize${reset_color}"
    echo "size:\t\t${fg_bold[white]}$__file_size${reset_color} bytes"
    echo "md5:\t\t${fg_bold[green]}$__file_md5${reset_color}"
    echo "sha1sum:\t${fg_bold[white]}$__file_sha1sum${reset_color}"
    echo "sha256sum:\t${fg_bold[green]}$__file_sha256sum${reset_color}"
  else
    echo "\n${fg_bold[red]}${file} doesn't exist${reset_color}\n"
  fi
done

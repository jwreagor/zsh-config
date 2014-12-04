#!/bin/sh

for file in $*; do
  __file_size="$(command ls -l $file | cut -d ' ' -f 7)"
  __file_md5="$(md5 $file | cut -d ' ' -f 4)"
  __file_sha1sum="$(shasum $file | cut -c 1-40)"
  __file_sha256sum="$(openssl dgst -sha256 $file | cut -d ' ' -f 2)"

  echo "---"
  echo "${$fg[blue]}$file${reset_color}"
  echo "size:\t\t${fg_bold[white]}$__file_size${reset_color} bytes"
  echo "md5:\t\t${fg_bold[white]}$__file_md5${reset_color}"
  echo "sha1sum:\t${fg_bold[white]}$__file_sha1sum${reset_color}"
  echo "sha256sum:\t${fg_bold[white]}$__file_sha256sum${reset_color}"
done

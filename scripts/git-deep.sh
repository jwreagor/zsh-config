#!/usr/bin/env zsh

ver=0.2.0
prg="${fg_bold[blue]}$(basename $0)${reset_color}"
let num=0

log_op() {
  echo "${fg_bold[blue]} --->${reset_color} ${fg_bold[white]}$1${reset_color} $2"
}

log_prg() {
  echo "$prg $1"
}

update_fetch() {
  log_op "Fetching"
  git_cmd "fetch"
}

update_pull() {
  log_op "Pulling"
  git_cmd "pull"
}

git_cmd() {
  cd $dir
  if [ -d ".git/refs/remotes" ] || [ -d "refs/remotes" ]; then
    [ -z $DEBUG ] || echo "git $cmd"
    git $1
  fi
}

deep_dirs() {
  find -d . -type d -name "*.git" | \
    sed "s/\(\/\.git\)$//" | \
    grep -v "\.bundle"
}

do_dir() {
  back=$(pwd)

  if echo $1 | grep -q "\.git$"; then
    update_fetch
  else
    update_pull
  fi

  log_op "Leaving" $1
  echo
  cd $back
}

do_update() {
  for dir in $(deep_dirs); do
    name=$(echo $dir | sed "s/^\(\.\/\)//")
    log_op "Found" $dir
    [ -z $1 ] && do_dir $dir
    num=$num+1
  done
  echo "Updated $num"
}

for arg in $*; do
  case $arg in
    -v|--version)
      log_prg "${fg_bold[white]}v$ver${reset_color}"
      ;;
    -h|--help)
      echo "traverse nested directories and update all the git repos"
      log_prg "-- (c) 2014 Copyright, Justin Reagor <cheapRoc> BSD"
      ;;
    -l|--list)
      for dir in $(deep_dirs); do
        echo $dir
      done
      ;;
    -d|--dry-run)
      do_update "dry"
      ;;
    -u|--update)
      do_update
      ;;
  esac
  unset num
  exit 0
done


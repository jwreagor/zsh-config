#!/usr/bin/env zsh

autoload colors && colors

_nfo_="traverse down nested directories and pull/fetch all the git repos found"
_ver_="v0.3.0"
_prg_="%{$fg_bold[blue]%}$(basename $0)%{$reset_color%}"
_cpy_="$_ver_ -- (c) 2014 Copyright, Justin Reagor <cheapRoc> BSD"
_dry_=0

log_op() {
  print -P "%{$fg_bold[blue]%} --->%{$reset_color%} %{$fg_bold[white]%}$1%{$reset_color%} $2"
}

log_grey() {
  print -P "%{$fg_bold[blue]%} --->%{$reset_color%} %{$fg_no_bold[white]%}$(basename $1)%{$reset_color%} $2"
}

log_opt() {
  cmds="%{$fg_bold[blue]%}$1%{$reset_color%}, %{$fg_bold[grey]%}$2\t%{$reset_color%}"
  print -P "$cmds\t%{$fg_no_bold[white]%}$3%{$reset_color%}"
}

log_prg() {
  print -P "$_prg_ $1"
}

update_fetch() {
  [ $_dry_ -ne "0" ] || git_cmd "fetch"
}

update_pull() {
  [ $_dry_ -ne "0" ] || git_cmd "pull"
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
    log_op "Fetching" $(basename $1)
    update_fetch
  else
    log_op "Pulling" $(basename $1)
    update_pull
  fi

  [ -z $DEBUG ] || log_op "Leaving" $1
  echo
  cd $back
}

do_update() {
  let num=0
  for dir in $(deep_dirs); do
    name=$(echo $dir | sed "s/^\(\.\/\)//")
    do_dir $dir
    log_grey "Done" $dir
    num=$num+1
    echo
  done
  echo "Updated $num"
  unset num
}

do_dry_run() {
  _dry_=1
  do_update
}

do_help() {
  echo
  log_prg $_cpy_
  echo
  print -P "%{$fg_no_bold[white]%}$_nfo_%{$reset_color%}"
  echo
  log_opt "-v" "--version" "List version information"
  log_opt "-h" "--help"    "List commands and information"
  log_opt "-l" "--list"    "Find and list all git directories"
  log_opt "-d" "--dry-run" "Don't perform any actions on found git repos"
  log_opt "-u" "--update"  "Iterate over every nested repo and fetch/update each"
  echo
}

for arg in $*; do
  case $arg in
    -v|--version)
      log_prg "%{$fg_no_bold[white]%}$_ver_%{$reset_color%}"
      ;;
    -l|--list)
      for dir in $(deep_dirs); do
        echo $dir
      done
      ;;
    -d|--dry-run)
      do_dry_run
      ;;
    -u|--update)
      do_update
      ;;
    -h|--help)
      do_help
      ;;
    -o|--origin)
      echo $arg
      ;;
    *)
      ;;
  esac
  args=$args+1
done

unset args
exit 0

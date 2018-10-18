#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o xtrace

_nfo_="uptime with options"
_ver_="0.1.0"
_prg_="${fg_bold[blue]}$(basename $0)${reset_color}"

log_op() {
  echo "${fg_bold[blue]} --->${reset_color} ${fg_bold[white]}$1${reset_color} $2"
}

log_prg() {
  echo "$_prg_ $1"
}

squeeze() {
  sed -E 's/^[ \t]+//' | sed -E 's/[ \t]+$//'
}

clean_user() {
  sed -E 's/users[, \t]?//'
}

clean_users() {
  sed -E 's/,?([0-9]+.users[, \t]?)//'
}

clean_time() {
  _global=$1
  sed -E "s/(.?(([0-9]{2}):?){2})+[, \t]?//$_global"
}

clean_times() {
  clean_time "g"
}

clean_load() {
  sed -E 's/(\w?load.averages:[, \t]?)//'
}

clean_days() {
  sed -E 's/([0-9]+ days)[, \t]?//'
}

clean_commas() {
  sed -E 's/,+//g'
}

clean_up() {
  sed -E 's/(.?up)[, \t]//'
}

clean_uptime() {
  command uptime | clean_up
}

clean_values() {
  clean_commas | clean_days | clean_load | clean_user
}

for arg in $*; do
  case $arg in
    -v|--version|version)
      log_prg "${fg_bold[white]}version $_ver_${reset_color}"
      ;;
    -h|--help|help)
      echo $_nfo_
      log_prg "$_ver_ -- (c) $(date +"%Y") Copyright, Justin Reagor <cheapRoc> BSD"
      ;;
    -u|--values|values)
      clean_uptime | clean_values
      ;;
    -t|--text|text)
      clean_uptime | clean_users | clean_load
      ;;
    -l|--load|load)
      clean_uptime | clean_times | clean_load
      ;;
    cute)
      clean_uptime | clean_times | clean_load | sed -E 's/users/👤 /' | sed -E 's/days/🌘 /' | echo "$(clean_commas) ♨️"
      ;;
    *)
      uptime
      ;;
  esac | squeeze
  exit 0
done

#!/bin/sh
#
# Single command for brew update, outdated, and upgrade.
#

do_update() {
  if brew update 1>/dev/null; then
    brew outdated -l
  else
    echo
    echo "something ain't brewing :("
    exit 666
  fi
}

do_upgrade() {
  echo
  echo "Upgrade? (y/n) "
  read ok

  case $ok in
    y|Y|yes|YES)
      brew upgrade
      ;;
    n|N|no|NO)
      echo
      echo "ok boss"
      exit 2
      ;;
    *)
      brew upgrade
      ;;
  esac
  unset ok
}

do_cleanup() {
  echo
  echo "Clean up? (y/n/s) "
  read ok

  case $ok in
    y|Y|yes|YES)
      brew cleanup
      ;;
    s|S|show|SHOW)
      brew cleanup -n
      do_cleanup
      ;;
    n|N|no|NO)
      echo
      echo "ok boss"
      exit 3
      ;;
    *)
      brew cleanup -n
      do_cleanup
      ;;
  esac
  unset ok
}

do_update && do_upgrade && do_cleanup

exit 0

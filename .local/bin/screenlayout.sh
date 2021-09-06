#!/usr/bin/env bash
set -euo pipefail
BASEPATH="$HOME/.screenlayout"
HOSTNAME=${HOSTNAME?"hostname nicht gesetzt"}
operation=${1:-"offline"}

case "$operation" in
  "docked")
     #echo "Usage: ${0##*/} <filename>"; exit $E_PARAM
     FILENAME="${BASEPATH}/${HOSTNAME}-docked.sh"
     if [ -x $FILENAME ]; then $FILENAME; fi
     ;;

  "multi")
     arandr
     ;;
  * )
     FILENAME="${BASEPATH}/${HOSTNAME}.sh"
     if [ -x $FILENAME ]; then $FILENAME; fi
     ;;
esac

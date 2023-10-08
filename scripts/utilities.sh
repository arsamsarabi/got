function log {
  if [ "$GOT_DEBUG" == "true" ]; then
    DATETIME=`date +'%a %d/%b %H:%M'`
    echo "[$DATETIME] - $1" >> ./logs/installation.log
  fi
}

function pretty_print {
  gum style \
    --foreground 225 --align left --margin "1 0" \
    "$1"
  log "$1"
}

function print_header {
  clear
  cat ./assets/got.txt | lolcat
}

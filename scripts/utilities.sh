function log {
  if [ "$GOT_DEBUG" == "true" ]; then
    DATETIME=`date +'%a %d/%b %H:%M'`
    echo "[$DATETIME] - $1" >> ./logs/installation.log
  fi
}

function ask {
  gum style \
    --foreground 61 --align left --margin "0.75 2" \
    "? > $1"
}

function tell {
  gum style \
    --foreground 189 --align left --margin "0.75 2" \
    "! > $1"
  log "! > $1"
}


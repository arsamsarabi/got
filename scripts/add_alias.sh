function choose_dotfile {
  pretty_print "📁 Choose the dotfile you use for aliases:"
  FILE_PATH=$(gum file $HOME --all)
  log "Dotfile chosen: $FILE_PATH"
  sleep 1
}

function choose_alias_name {
  pretty_print "🚀 Choose the alias name for got (defaults to got):"
  ALIAS_NAME=$(gum input --value "got" --header "Alias name")
  log "Alias name chosen: $ALIAS_NAME"
  sleep 1
}

function add_alias_to_dotfile {
  ALIAS_LINE="alias $ALIAS_NAME='~/.got/got.sh'"
  pretty_print "📝 Adding alias $ALIAS_NAME to $FILE_PATH ..."
  
  if awk -v text="$ALIAS_LINE" '$0 == text { found = 1; exit } END { exit !found }' $FILE_PATH; then
    pretty_print "🚨 $ALIAS_LINE already exists in $FILE_PATH."
  else
    echo "" >> $FILE_PATH
    echo "# -------------------------" >> $FILE_PATH
    echo "# GOT ---------------------" >> $FILE_PATH
    echo "alias $ALIAS_NAME='~/.got/got.sh'" >> $FILE_PATH
    echo "# -------------------------" >> $FILE_PATH
  fi

  sleep 1
}


function add_alias {
  print_header
  choose_dotfile
  choose_alias_name
  add_alias_to_dotfile
}

GOT_FILE_NAME=""
GOT_DOTFILE_PATH=""
GOT_ALIAS_NAME=""
GOT_ALIAS_LINE=""

function choose_dotfile {
  ask "📁 Choose the dotfile you use for aliases (located under $HOME):"
  GOT_FILE_NAME=$(gum input --placeholder ".zshrc" --header "Dotfile path defaults to .zshrc" --value ".zshrc")
  GOT_DOTFILE_PATH="$HOME/$GOT_FILE_NAME"
  tell "Dotfile got: $GOT_FILE_NAME"
  tell "Dotfile path: $GOT_DOTFILE_PATH"
}

function choose_alias_name {
  ask "🚀 Choose the alias name for got (defaults to got):"
  GOT_ALIAS_NAME=$(gum input --value "got" --header "Alias name")
  tell "Alias name got: $GOT_ALIAS_NAME"
}

function add_alias_to_dotfile {
  GOT_ALIAS_LINE="alias $GOT_ALIAS_NAME='~/.got/got.sh'"
  log "📝 Adding alias $GOT_ALIAS_NAME to $GOT_FILE_NAME ..."
  
  if awk -v text="$GOT_ALIAS_LINE" '$0 == text { found = 1; exit } END { exit !found }' $GOT_DOTFILE_PATH; then
    log "🚨 $GOT_ALIAS_LINE already exists in $GOT_FILE_NAME."
  else
    echo "" >> $GOT_FILE_NAME
    echo "# --------------------------------" >> $GOT_FILE_NAME
    echo "# GOT ----------------------------" >> $GOT_FILE_NAME
    echo "alias $GOT_ALIAS_NAME='~/.got/got.sh'" >> $GOT_FILE_NAME
    echo "# --------------------------------" >> $GOT_FILE_NAME
  fi
}


function add_alias {
  choose_dotfile
  choose_alias_name
  add_alias_to_dotfile
}

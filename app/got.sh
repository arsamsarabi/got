#!/bin/sh

source ~/.got/utilities.sh
source ~/.got/branch.sh
source ~/.got/commit.sh
source ~/.got/rebase.sh

function main {
  clear
  welcome_message
  
  gum style \
    --foreground 225 --align left --margin "1 0" \
    'Choose from the following functions:'

  ACTIONS=$(gum choose "🌱 New branch" "📝 Commit" "🔥 Rebase" "🚪 Quit")

  case $ACTIONS in
    "🌱 New branch")
      handle_branch
      ;;
    "📝 Commit")
      handle_commit
      ;;
    "🔥 Rebase")
      handle_rebase
      ;;
    "🚪 Quit")
      exit 0
      ;;
  esac 
}

main


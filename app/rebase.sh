function do_rebase {
  git fetch $1 main && git rebase $1/main -i
  gum confirm "Push to origin?" && git push -f
}

function handle_rebase {
  # SETUP
  # ------------------------------
  APP_STATUS="🔄 Rebase menu"
  clear
  status_bar

  # CHOOSE ACTION
  # ------------------------------
  ask "Rebasing on top of origin or upstream?:"
  local ACTIONS=$(gum choose "Origin" "Upstream")
  tell "Rebasing on top of $ACTIONS"

  case $ACTIONS in
    "Origin")
      do_rebase origin
      ;;
    "Upstream")
      do_rebase upstream
      ;;
  esac 
}

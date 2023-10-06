function do_rebase {
  git fetch $1 main && git rebase $1/main -i
  gum confirm "Push to origin?" && git push -f
}

function handle_rebase {
  gum style \
    --foreground 225 --align left --margin "1 0" \
    'Rebasing on top of origin or upstream?:'

  ACTIONS=$(gum choose "Origin" "Upstream")

  case $ACTIONS in
    "Origin")
      do_rebase origin
      ;;
    "Upstream")
      do_rebase upstream
      ;;
  esac 
}

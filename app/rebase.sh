function handle_rebase {
  gum style \
    --foreground 225 --align left --margin "1 0" \
    'Rebasing on top of origin or upstream?:'

  ACTIONS=$(gum choose "Origin" "Upstream")

  case $ACTIONS in
    "Origin")
      git fetch origin main && git rebase origin/main -i
      ;;
    "Upstream")
      git fetch upstream main && git rebase upstream/main -i
      ;;
  esac 
}

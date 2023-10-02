function handle_branch {
  clear 
  gum style \
    --foreground 225 --align left --margin "1 0" \
    'What is the type of change that you want to implement in this branch?:'
  CATEGORY=$(gum choose "fix" "feature" "docs" "tests" "chore" "revert" "ci" "release" "demo" "other")

  clear 
  gum style \
    --foreground 225 --align left --margin "1 0" \
    'Do you have a ticket number for the work?:'
  TICKET_NUMBER=$(gum input --placeholder "e.g. TRF-123")

  clear 
  gum style \
    --foreground 225 --align left --margin "1 0" \
    'Finally, give your branch a name:'  
  BRANCH_NAME=$(gum input --placeholder "e.g. awesome new user journey feature")

  test -n "$CATEGORY" && CATEGORY="$CATEGORY/"
  test -n "$TICKET_NUMBER" && TICKET_NUMBER="$TICKET_NUMBER-"
  
  if [ ${#BRANCH_NAME} -lt 1 ];
  then
    BRANCH_NAME="my-cool-new-branch-that-i-forgot-to-name"
  else
    BRANCH_NAME="${BRANCH_NAME// /-}"
  fi

  BRANCH="$CATEGORY$TICKET_NUMBER$BRANCH_NAME"

  clear
  gum confirm "Create branch? $BRANCH" && git checkout -b $BRANCH
}

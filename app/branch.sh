function new_branch {
  # SETUP
  # ------------------------------
  APP_STATUS="✨ New branch"
  clear 
  status_bar
  
  # BRANCH CATEGORY
  # ------------------------------
  ask "What is the type of change that you want to implement in this branch?:"
  local CATEGORIES=("fix" "feature" "docs" "tests" "chore" "revert" "ci" "other")
  local CATEGORY=$(gum choose "${CATEGORIES[@]}")
  tell "Branch category: $CATEGORY"

  # TICKET NUMBER
  # ------------------------------
  ask "Great! Now, do you have a ticket number for the work?"
  local TICKET_NUMBER=$(gum input --placeholder "e.g. TRF-123")
  tell "Ticket number: $TICKET_NUMBER"

  # BRANCH NAME
  # ------------------------------
  ask "Finally, give your branch a name:"
  local BRANCH_NAME=$(gum input --placeholder "e.g. awesome new user journey feature")

  test -n "$CATEGORY" && CATEGORY="$CATEGORY/"
  test -n "$TICKET_NUMBER" && TICKET_NUMBER="$TICKET_NUMBER-"
  
  if [ ${#BRANCH_NAME} -lt 1 ];
  then
    BRANCH_NAME="my-cool-new-branch-that-i-forgot-to-name"
  else
    BRANCH_NAME="${BRANCH_NAME// /-}"
  fi

  tell "Branch name: $BRANCH_NAME"

  # CREATE BRANCH
  # ------------------------------
  local BRANCH="$CATEGORY$TICKET_NUMBER$BRANCH_NAME"
  gum confirm "Create branch? $BRANCH" && git checkout -b $BRANCH
}

function checkout_branch {
  # SETUP
  # ------------------------------
  APP_STATUS="🔀 Checkout branch"
  clear
  status_bar

  # CHOOSE BRANCH
  # ------------------------------
  local BRANCHES=$(git branch -a)
  tell "Choose a branch to checkout:"
  local BRANCH_TO_CHECKOUT=$(git branch -a | gum filter | gum choose) 
  
  # CHECKOUT BRANCH
  # ------------------------------
  gum confirm "Checkout branch? $BRANCH_TO_CHECKOUT" && git checkout $BRANCH_TO_CHECKOUT
}

function handle_branch {
  # SETUP
  # ------------------------------
  APP_STATUS="🌱 Branch menu"
  clear
  status_bar
  
  # CHOOSE ACTION
  # ------------------------------
  tell "Choose from the following functions:"
  local NEW_BRANCH="🌱 New branch"
  local CHECKOUT="🔀 Checkout branch"
  local QUIT="🚪 Quit"

  local ACTIONS=$(gum choose "$NEW_BRANCH" "$CHECKOUT" "$QUIT")

  case $ACTIONS in
    "$NEW_BRANCH")
      new_branch
      ;;
    "$CHECKOUT")
      checkout_branch
      ;;
    "$QUIT")
      exit 0
      ;;
  esac 
}

#!/bin/sh

# functions

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

function do_commit {
  clear
  gum style \
    --foreground 225 --align left --margin "1 0" \
    'What is the type of change that you want to commit?:'
  COMMIT_OPT_TYPE=$(gum choose "fix" "feat" "docs" "style" "refactor" "perf" "test" "chore" "revert" "build" "ci" "release" "other")

  clear
  gum style \
    --foreground 225 --align left --margin "1 0" \
    'What is the scope of this commit?:'
  SCOPE=$(gum input --placeholder "scope")

  test -n "$SCOPE" && SCOPE="($SCOPE)"

  clear
  gum style \
    --foreground 225 --align left --margin "1 0" \
    'Write a summary for this commit (72 characters max):'
  SUMMARY=$(gum input --value "$COMMIT_OPT_TYPE$SCOPE: " --placeholder "Summary of this change")

  clear
  gum style \
    --foreground 225 --align left --margin "1 0" \
    'Write a more comprehensive description of these changes (multi-line):'  
  DESCRIPTION=$(gum write --placeholder "Details of this change (control+D to finish)")

  gum confirm "Commit changes?" && git commit -m "$SUMMARY" -m "$DESCRIPTION"
}

function handle_commit {
  gum style \
    --foreground 225 --align left --margin "1 0" \
    'Have you staged your changes?:'

  ACTIONS=$(gum choose "Yes!" "No, stage all changes for me" "No, let me stage my changes first")

  case $ACTIONS in
    "Yes!")
      do_commit
      ;;
    "No, stage all changes for me")
      git add .
      do_commit
      ;;
    "No, let me stage my changes first")
      exit 0
      ;;
  esac 

}

function welcome_message {
  gum style \
    --background 67 --foreground 117  \
    --align center --width 50 --margin "2 2" --padding "1 1" \
    'got the Git assistant.' '' 'Arsam Sarabi - arsamsarabi@me.com'
}

function get_operation_choice {
  gum style \
    --foreground 225 --align left --margin "1 0" \
    'Choose from the following functions:'

  ACTIONS=$(gum choose "New branch" "Commit" "Quit")

  case $ACTIONS in
    "New branch")
      handle_branch
      ;;
    "Commit")
      handle_commit
      ;;
    "Quit")
      exit 0
      ;;
  esac  
}

function main {
  clear
  welcome_message
  get_operation_choice
}

main


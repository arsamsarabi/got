function do_stage {
  # SETUP
  # ------------------------------
  APP_STATUS="🎬 Stage changes"
  clear
  status_bar

  # STAGE CHANGES
  # ------------------------------
  if [ -z "$(git status -s -uno | grep -v '^ ' | awk '{print $2}')" ]; then
    gum confirm "Stage all?" && git add .
  fi
}

function do_commit {
  # SETUP
  # ------------------------------
  APP_STATUS="📤 Commit changes"  
  clear
  status_bar

  # COMMIT TYPE
  # ------------------------------
  ask "What is the type of change that you want to commit?:"
  local COMMIT_OPT_TYPE=$(gum choose "fix" "feat" "docs" "refactor" "other")
  tell "Commit type: $COMMIT_OPT_TYPE"

  # COMMIT SCOPE
  # ------------------------------
  ask "What is the scope of this commit?:"
  local SCOPE=$(gum input --placeholder "scope")
  tell "Commit scope: $SCOPE"
  test -n "$SCOPE" && SCOPE="($SCOPE)"

  # COMMIT SUMMARY
  # ------------------------------
  ask "Write a summary for this commit (72 characters max):"
  local SUMMARY=$(gum input --value "$COMMIT_OPT_TYPE$SCOPE: " --placeholder "Summary of this change")
  tell "Commit summary: $SUMMARY"

  # COMMIT DESCRIPTION
  # ------------------------------ 
  ask "Write a more comprehensive description of these changes (multi-line):"  
  local DESCRIPTION=$(gum write --placeholder "Details of this change (control+D to finish)")
  tell "Commit description: $DESCRIPTION"

  # CONFIRM COMMIT
  # ------------------------------
  ask "Commit changes?:"
  local ACTIONS=$(gum choose "Yes - commit only" "Yes - commit & push" "No - abort commit")

  case $ACTIONS in
    "Yes - commit only")
      git commit -m "$SUMMARY" -m "$DESCRIPTION"
      ;;
    "Yes - commit & push")
      git commit -m "$SUMMARY" -m "$DESCRIPTION"
      git push
      ;;
    "No - abort commit")
      exit 0
      ;;
  esac 
}

function handle_commit {
  # SETUP
  # ------------------------------
  APP_STATUS="📝 Commit menu"
  clear
  status_bar

  # STAGE
  # ------------------------------
  do_stage

  # COMMIT
  # ------------------------------
  do_commit
}


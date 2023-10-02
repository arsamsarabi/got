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


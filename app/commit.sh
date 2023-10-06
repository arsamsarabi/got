function do_stage {
  echo "Staging changes..."
  if [ -z "$(git status -s -uno | grep -v '^ ' | awk '{print $2}')" ]; then
    gum confirm "Stage all?" && git add .
  fi
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

  clear
  gum style \
    --foreground 225 --align left --margin "1 0" \
    'Commit changes?:'
  ACTIONS=$(gum choose "Yes - commit only" "Yes - commit & push" "No - abort commit")

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
  echo "Committing changes..."
  clear
  do_stage
  gum confirm "Commit changes?" && do_commit
}


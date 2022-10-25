#!/bin/sh

TYPE=$(gum choose "fix" "feat" "docs" "style" "refactor" "perf" "test" "chore" "revert" "build" "ci" "release" "other")
SCOPE=$(gum input --placeholder "scope")

test -n "$SCOPE" && SCOPE="($SCOPE)"

SUMMARY=$(gum input --value "$TYPE$SCOPE: " --placeholder "Summary of this change")
DESCRIPTION=$(gum write --placeholder "Details of this change (CMD+D to finish)")

gum confirm "Commit changes?" && git commit -m "$SUMMARY" -m "$DESCRIPTION"

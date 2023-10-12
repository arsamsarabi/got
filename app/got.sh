#!/bin/sh

# GLOBAL VARS
# ---------------------------------------------
APP_STATUS=""
CURRENT_GIT_BRANCH=""

# FUNCTIONS
# ---------------------------------------------
source ~/.got/branch.sh
source ~/.got/commit.sh
source ~/.got/rebase.sh
source ~/.got/utilities.sh

# RUN
# ---------------------------------------------
intro
main_menu

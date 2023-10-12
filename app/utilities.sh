GOT_MENU_BG_COLOUR=189
GOT_MENU_FG_COLOUR=54

function ask {
  gum style \
    --foreground 225 --align left  --margin "0 2" \
    "? > $1"
}

function tell {
  gum style \
    --foreground 189 --align left  --margin "0 2" \
    "! > $1"
}

function welcome_message {
  clear
  gum style \
    --background $GOT_MENU_BG_COLOUR --foreground $GOT_MENU_FG_COLOUR --bold  \
    --align center --margin "1 2 0 2" --padding "1 2" \
    'got the Git assistant.' '' 'Arsam Sarabi - arsamsarabi@me.com'
}

function no_git_message {
  clear
  gum style \
    --background 52 --foreground 225 \
    --bold --align center --margin "0 2" --padding "1 2" \
    '🚨 404 - Git not found. 🚨' '' 'Make sure you are in the root folder of a git repository and try again.'
}

function status_bar {
  gum style \
    --background $GOT_MENU_BG_COLOUR --foreground $GOT_MENU_FG_COLOUR \
   --margin "1 2" --padding "1 2" --bold \
    "$APP_STATUS | 🌱: $CURRENT_GIT_BRANCH"
}

function intro {
  if [ -d .git ]; then
    CURRENT_GIT_BRANCH=$(if [ -d .git ]; then git symbolic-ref --short HEAD 2>/dev/null; fi)
    welcome_message
  else
    no_git_message
    exit 1
  fi
}

function main_menu {
  # SETUP
  # ------------------------------
  APP_STATUS="🏠 Main menu"
  status_bar
  
  ask "Choose from the following functions:"

  local BRANCH="🌱 Branch"
  local COMMIT="📝 Commit"
  local REBASE="🔄 Rebase"
  local STATUS="📊 Status"
  local QUIT="🚪 Quit"

  local ACTIONS=$(gum choose "$BRANCH" "$COMMIT" "$REBASE" "$STATUS" "$QUIT")

  case $ACTIONS in
    "$BRANCH")
      handle_branch
      ;;
    "$COMMIT")
      handle_commit
      ;;
    "$REBASE")
      handle_rebase
      ;;
    "$STATUS")
      print_git_info
      ;;      
    "$QUIT")
      exit 0
      ;;
  esac 
}

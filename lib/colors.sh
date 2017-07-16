# Common modifiers
export COL_BOLD
export COL_RESET

# Solarized colors
export SOL_BLACK
export SOL_BLUE
export SOL_CYAN
export SOL_GREEN
export SOL_ORANGE
export SOL_PURPLE
export SOL_RED
export SOL_WHITE
export SOL_YELLOW

if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  COL_BOLD=$(tput bold)
  COL_RESET=$(tput sgr0)

  SOL_BLACK=$(tput setaf 0)
  SOL_BLUE=$(tput setaf 33)
  SOL_CYAN=$(tput setaf 37)
  SOL_GREEN=$(tput setaf 64)
  SOL_ORANGE=$(tput setaf 166)
  SOL_PURPLE=$(tput setaf 125)
  SOL_RED=$(tput setaf 124)
  SOL_WHITE=$(tput setaf 15)
  SOL_YELLOW=$(tput setaf 136)
else
  COL_BOLD=""
  COL_RESET="\e[0m"

  SOL_BLACK="\e[1;30m"
  SOL_BLUE="\e[1;34m"
  SOL_PURPLE="\e[1;35m"
  SOL_CYAN="\e[1;36m"
  SOL_GREEN="\e[1;32m"
  SOL_ORANGE="\e[1;33m"
  SOL_RED="\e[1;31m"
  SOL_WHITE="\e[1;37m"
  SOL_YELLOW="\e[1;33m"
fi

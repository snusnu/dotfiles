#!/bin/bash

e_header()  { printf "\n$(tput setaf 7)%s${COL_RESET}\n" "$@"; }
e_success() { printf "${SOL_GREEN}✓ %s${COL_RESET}\n" "$@"; }
e_error()   { printf "${SOL_RED}x %s${COL_RESET}\n" "$@"; }
e_warning() { printf "${SOL_YELLOW}! %s${COL_RESET}\n" "$@"; }

# Ask for confirmation before proceeding
seek_confirmation() {
  printf "\n"
  e_warning "$@"
  read -rp "Continue? (y/n) " -n 1
  printf "\n"
}

# Test whether the result of an 'ask' is a confirmation
is_confirmed() {
  if [[ "$REPLY" =~ ^[Yy]$ ]]; then
    return 0
  else
    return 1
  fi
}

# Test whether we're in a git repo
is_git_repo() {
  git rev-parse --is-inside-work-tree &> /dev/null
}

# Test whether a command exists
# $1 - cmd to test
type_exists() {
  if [ "$(type -P "$1")" ]; then
    return 0
  else
    return 1
  fi
}

# Recursively delete files that match a certain pattern
# (by default delete all `.DS_Store` files)
cleanup() {
  local q="${1:-*.DS_Store}"
  find . -type f -name "$q" -ls -delete
}

# Search History
qh() {
  #      ┌─ enable colors for pipe
  #      │  ("--color=auto" enables colors only if
  #      │  the output is in the terminal)
  grep --color=always "$@" < ~/.bash_history | less -RX
  #     the ANSI color escape sequences in raw form ─┘│
  #       don't clear the screen after quitting less ─┘
}

# Search for text within the current directory
qt() {
  grep -ir --color=always "$@" . | less -RX
  #     │└─ search all files under each directory, recursively
  #     └─ ignore case
}

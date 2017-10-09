#!/bin/bash

# Test whether a Homebrew formula is already installed
# $1 - formula name (may include options)
formula_exists() {
  if brew list "$1" >/dev/null; then
    printf "%s already installed.\n" "$1"
    return 0
  fi

  e_warning "Missing formula: $1"
  return 1
}

run_brew() {
  if type_exists 'brew'; then

    e_header "Installing homebrew formulas ..."

    brew install coreutils
    brew install findutils
    brew install tree
    brew install wget --enable-iri
    brew install git
    brew install rsync
    brew install ack
    brew install ctags
    brew install bash
    brew install bash-completion
    brew install tmux
    brew install vim --override-system-vi
    brew install python --with-brewed-openssl
    brew install the_silver_searcher
    brew install htop-osx
    brew install icu4c
    brew install cmake
    brew install httpie
    brew install hr
    brew install hh
    brew install jq
    brew install postgresql
    brew install ruby-install --HEAD
    brew install chruby --HEAD
    brew install shellcheck
    brew install graphviz --with-pango

    e_header "Installing homebrew casks ..."

    brew cask install firefox
    brew cask install flash-player
    brew cask install google-chrome
    brew cask install google-hangouts
    brew cask install iterm2
    brew cask install postico
    brew cask install sequel-pro
    brew cask install mesasqlite
    brew cask install github-desktop
    brew cask install slack
    brew cask install flowdock
    brew cask install transmission
    brew cask install virtualbox
    brew cask install vagrant
    brew cask install vlc
    brew cask install skype
    brew cask install the-unarchiver
    brew cask install libreoffice
    brew cask install insomniax
    brew cask install itunes-volume-control
    brew cask install osxfuse
    brew cask install mediathekview
    brew cask install macpass
    brew cask install gpgtools
    brew cask install owasp-zap
    brew cask install macvim

    # Remove outdated versions from the Cellar
    brew cleanup
    brew cask cleanup
  else
    printf "\n"
    e_error "Error: Homebrew not found."
    printf "Aborting...\n"
    exit
  fi
}

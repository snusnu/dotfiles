#!/bin/bash

run_help() {
cat <<EOT
macOS dotfiles - https://github.com/snusnu/dotfiles

Usage: $(basename "$0") [options]

Options:
    -h, --help      Print this help text
    --no-packages   Suppress package updates
    --no-sync       Suppress pulling from the remote repository

EOT
}

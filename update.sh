#!/bin/bash
set -e

if [ `basename "$PWD"` != "vimrc" ]; then
  echo "Error: This script should be run under vimrc directory."
  exit 1
fi

git submodule update --recursive --remote

wget -O schema.json https://raw.githubusercontent.com/neoclide/coc.nvim/release/data/schema.json
# By default don't reinstall LeaderF here, so some C extension updates in
# LeaderF may be ignored. Run "./install.sh" under LeaderF directory if needed.

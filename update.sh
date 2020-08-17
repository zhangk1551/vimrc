#!/bin/bash
set -e

if [ `basename "$PWD"` != "vimrc" ]; then
  echo "Error: This script should be run under vimrc directory."
  exit 1
fi

git submodule update --recursive
cp colors/base16/colors/base16-default-dark.vim colors/base16-default-dark.vim

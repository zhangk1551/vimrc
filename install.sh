#!/bin/bash
set -e

if [ `basename "$PWD"` != "vimrc" ]; then
  echo "Error: This script should be run under vimrc directory."
  exit 1
fi

git submodule update --init --recursive

cd pack/plugins/start/LeaderF
./install.sh
cd ../../../../

cd pack/plugins/start/coc.nvim
yarn install
yarn build
cd ../../../../

./update.sh

mkdir ~/.vimbackup
mkdir ~/.vimswp
mkdir ~/.vimundo

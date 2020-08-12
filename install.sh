#!/bin/bash
set -e

if [ `basename "$PWD"` != ".vim" ]; then
  echo "Error: This script should be run under .vim directory."
  exit 1
fi

mkdir .swp

git submodule update --init --recursive

./update.sh

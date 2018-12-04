#!/bin/bash

set -euo pipefail

cd "$(dirname "$0")/.." || exit

echo "[1/4] Linking vimrc"
ln -sf "$PWD/vim/vimrc" "$HOME/.vimrc"

echo "[2/4] Installing vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "[3/4] Installing deoplete python prereqs"
pip3 install --user --upgrade pynvim

echo "[3/4] Install Plugins"
vim +PlugInstall +qall

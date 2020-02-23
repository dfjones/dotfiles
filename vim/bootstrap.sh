#!/bin/bash

# On Feb 23 2020 I switched this to actually bootstrap neovim

set -euo pipefail

cd "$(dirname "$0")/.." || exit

echo "[1/4] Linking vimrc"
mkdir -p "$HOME/.config/nvim"
ln -sf "$PWD/vim/vimrc" "$HOME/.config/nvim/init.vim"

echo "[2/4] Installing vim-plug"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "[3/4] Installing deoplete python prereqs"
pip3 install --user --upgrade pynvim

echo "[4/4] Install Plugins"
nvim +PlugInstall +qall

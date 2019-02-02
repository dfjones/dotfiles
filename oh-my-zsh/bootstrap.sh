#!/bin/zsh

set -ex

env

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "oh-my-zsh must be installed first!"
  exit 1
fi

ZSH_CUSTOM="$ZSH/custom"

echo "Cloning spaceship theme"
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"

ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
echo "Set ZSH_THEME="spaceship" in your .zshrc."


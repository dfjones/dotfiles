#!/bin/zsh

set -ex

env

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "oh-my-zsh must be installed first!"
  exit 1
fi

ZSH_CUSTOM="$ZSH/custom"
ZSH_PLUGINS="$ZSH/custom/plugins"

echo "Cloning and installing nerd fonts"
git clone https://github.com/ryanoasis/nerd-fonts.git --depth=1
cd nerd-fonts
./install.sh Meslo
cd ..
rm -rf nerd-fonts

echo "Cloning spaceship theme"
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"

ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
echo "Set ZSH_THEME="spaceship" in your .zshrc."

echo "Cloning zsh vim mode plugin"
git clone https://github.com/softmoth/zsh-vim-mode.git "$ZSH_PLUGINS/zsh-vim-mode"

echo "Copying base .zshrc file"
cp zshrc ~/.zshrc



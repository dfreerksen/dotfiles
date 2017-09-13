#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

function commandExists () {
  command -v "${1}" >/dev/null 2>&1
}

function doIt () {
  rsync --exclude ".DS_Store" -avh --no-perms ./resources/ ~;

  source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  doIt;
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt;
  fi;
fi;

unset doIt;

# Install Homebrew
if ! commandExists brew; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install Homebrew formulae
brew bundle --file=./Brewfile

# Install Cask applications
brew bundle --file=./Caskfile

# Install latest of `plug.vim`
curl -fLo ~/.nvim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install latest of Tomorrow Night VIM theme
# https://github.com/ChrisKempson/Tomorrow-Theme
curl -fLo ~/.nvim/colors/Tomorrow-Night.vim --create-dirs \
  https://raw.githubusercontent.com/chriskempson/tomorrow-theme/master/vim/colors/Tomorrow-Night.vim

# Install NeoVim plugins
vim +PlugInstall +qall

echo "Done!"

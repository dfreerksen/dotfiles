#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

function commandExists () {
  command -v "${1}" >/dev/null 2>&1
}

function doIt () {
  rsync --exclude ".git/" --exclude ".DS_Store" --exclude "setup.sh" \
        --exclude "Brewfile" --exclude "Caskfile" --exclude "MIT-LICENSE" \
        --exclude "README.md" --exclude "TODO.md" \
        -avh --no-perms . ~;

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

# Update Homebrew
brew update

# Upgrade installed formulae
brew upgrade

# Install Homebrew formulae
brew bundle --file=./Brewfile

# Install Cask applications
brew bundle --file=./Caskfile

# Cleanup
brew cleanup

# Doctor
brew doctor

# Install latest of `plug.vim`
curl -fLo ~/.nvim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install latest of Tomorrow Night VIM theme
curl -fLo ~/.nvim/colors/Tomorrow-Night.vim --create-dirs \
  https://raw.githubusercontent.com/chriskempson/tomorrow-theme/master/vim/colors/Tomorrow-Night.vim

# Install NeoVim plugins
vim +PlugInstall +qall

echo "Done!"

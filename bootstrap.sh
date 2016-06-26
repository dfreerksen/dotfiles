#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

function doIt() {
  rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
        --exclude "MIT-LICENSE" --exclude "README.md" --exclude "TODO.md" \
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

curl -fLo ~/.nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

curl -fLo ~/.nvim/colors/Tomorrow-Night.vim --create-dirs https://raw.githubusercontent.com/chriskempson/tomorrow-theme/master/vim/colors/Tomorrow-Night.vim

# Install Homebrew
which -s brew
if [[ $? != 0 ]] ; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install NeoVim plugins
vim +PlugInstall +qall

# Sublime symlink
ln -sf "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl

echo "Done!"

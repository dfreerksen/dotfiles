#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

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

function commandExists () {
  command -v "${1}" >/dev/null 2>&1
}

# Install Homebrew
if ! commandExists brew; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

unset commandExists;

# Install Homebrew formulas
brew bundle --file=./Brewfile

# Install Cask applications
brew bundle --file=./Caskfile

# APM themes and packages for Atom
apmPackages=( angularjs atom-beautify busy-signal editorconfig intentions
              language-haml linter linter-csslint linter-erb linter-eslint
              linter-haml linter-htmlhint linter-js-standard linter-jshint
              linter-php linter-phpcs linter-reek linter-rubocop
              linter-scss-lint linter-ui-default minimap pigments
              rails-i18n-autocomplete rails-rspec svg-preview
              teletype yard )

for i in "${apmPackages[@]}"
do
  if [ ! -d "$HOME/.atom/packages/$i" ]
  then
    apm install $i
  else
    echo "Atom package $i already installed.";
  fi
done

# Install latest of `plug.vim`
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install latest of Tomorrow Night VIM theme
# https://github.com/ChrisKempson/Tomorrow-Theme
curl -fLo ~/.config/nvim/colors/Tomorrow-Night.vim --create-dirs \
     https://raw.githubusercontent.com/chriskempson/tomorrow-theme/master/vim/colors/Tomorrow-Night.vim

# Install NeoVim plugins
vim +PlugInstall +qall

# Doctor
brew doctor

echo "Done!"

#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

function doIt () {
  rsync --exclude ".DS_Store" -avh --no-perms ./resources/ ~;

  source ~/.zshrc;
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
apmPackages=( busy-signal color-picker linter linter-eslint linter-rubocop linter-stylelint linter-ui-default minimap 
              pigments rails-rspec svg-preview teletype yard )

for i in "${apmPackages[@]}"
do
  if [ ! -d "$HOME/.atom/packages/$i" ]
  then
    apm install $i
  else
    echo "Atom package $i already installed.";
  fi
done

# Cleanup
brew cleanup

# Doctor
brew doctor

echo "Done!"

#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Install wget with IRI support
brew install wget --enable-iri

# Install Node.js. Note: this installs `npm` too, using the recommended
# installation method.
brew install node

# Install io.js
brew install iojs

# Git
brew install git

# Vim
brew install vim --override-system-vi

# NeoVim
# brew tap neovim/homebrew-neovim
# brew install neovim

# PhantomJs
brew install phantomjs

# The Silver Searcher
brew install the_silver_searcher

# Imagemagick
brew install imagemagick --with-webp

# Remove outdated versions from the cellar
brew cleanup

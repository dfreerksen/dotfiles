.DEFAULT_GOAL := help
RUN_ARGS := $(wordlist 2, $(words $(MAKECMDGOALS)), $(MAKECMDGOALS))
.PHONY: default initial brew cask mas vscode copy setup

default: help

help : ## Show this help
	@grep -E '^[a-zA-Z0-9 -]+:.*#'  Makefile | sort | while read -r l; do printf "\033[1;32m$$(echo $$l | cut -f 1 -d':')\033[00m:$$(echo $$l | cut -f 2- -d'#')\n"; done

initial : ## Initial install. Make sure required tools are installed
	@echo "Initial setup"
	@./scripts/initial.sh

brew : ## Install Homebrew libraries
	@echo "Initialling Homebrew libraries"
	brew bundle install --file=./source/.Brewfile

cask : ## Install Homebrew applications
	@echo "Initialling Homebrew applications"
	brew bundle install --file=./source/.Caskfile

mas : ## Install App Store applications
	@echo "Initialling App Store applications"
	brew bundle install --file=./source/.Masfile

vscode : ## Install VSCode extensions
	@echo "Initialling VSCode extensions"
	@./scripts/vscode.sh

copy : ## Copy configuration files
	@echo "Copying files"
	cp -f $(PWD)/.zshrc ~/.zshrc
	cp -f $(PWD)/copy/.gemrc ~/.gemrc
	cp -Rf $(PWD)/copy/Documents/OpenSCAD/libraries/ ~/Documents/OpenSCAD/libraries/
	@./scripts/source.sh

setup : ## Initial setup. Meant for one time use only
	@echo "Setting up..."
	make initial
	make brew
	make cask
	make mas
	make vscode
	make copy

default :
	@echo "There is no default for your own safety."

initial :
	@echo "Initial setup"
	@./scripts/initial.sh

brew :
	@echo "Initialling Homebrew libraries"
	brew bundle install --file=./source/.Brewfile

cask :
	@echo "Initialling Homebrew applications"
	brew bundle install --file=./source/.Caskfile

mas :
	@echo "Initialling App Store applications"
	brew bundle install --file=./source/.Masfile

vscode :
	@echo "Initialling VSCode extensions"
	@./scripts/vscode.sh

copy :
	@echo "Copying files"
	cp -f $(PWD)/.gemrc ~/.gemrc
	cp -f $(PWD)/.zshrc ~/.zshrc
	@./scripts/source.sh

setup :
	@echo "Setting up..."
	make initial
	make brew
	make cask
	make mas
	make vscode
	make copy

update : 
	@echo "Updating..."
	make brew
	make cask
	make mas

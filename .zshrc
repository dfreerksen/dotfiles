# Rbenv
export PATH="$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# NVM
export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh

# Create a new directory and enter it
function mkcd() {
  mkdir -p "$@" && cd "$_";
}

# `o` with no arguments opens the current directory, otherwise opens the given location
function o() {
  if [ $# -eq 0 ]; then
    open .;
  else
    open "$@";
  fi;
}

##
# Prompt
##

function parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

setopt PROMPT_SUBST
PROMPT='%{%F{yellow}%}%n%{%F{white}%}@%{%F{green}%}%m%{%F{white}%}:%{%F{cyan}%}%~%{%F{yellow}%}$(parse_git_branch) %{%F{reset}%}$ '

##
# Key Bindings
##

# Move back (Opt + Left Arrow)
bindkey '\e\e[D' backward-word
bindkey '\e[3D' backward-word

# Move forward (Opt + Right Arrow)
bindkey '\e\e[C' forward-word
bindkey '\e[3C' forward-word

# Reload shell
alias sc="source $HOME/.zshrc"

# Shell helpers
alias c="clear"
alias h="history"

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# List all files colorized in long format, including hidden files
alias ll="ls -laF -G"

# Copy current path to clipboard
alias cpwd="pwd | tr -d '[:space:]' | pbcopy"

# Make a directory (if it doesn't already exist)
alias mkdir="mkdir -p"

# Bundler
alias be="bundle exec"
alias bi="bundle install"

# Docker Compose
alias dc="docker-compose"

# Ping
alias ping="ping -c 20"

# Get OS X Software Updates, Homebrew, Cask and NPM
alias brewup="brew --version; brew update; brew upgrade; brew upgrade --cask; brew cleanup --prune=30; brew doctor; brew --version"
alias masup="mas version; mas outdated; mas upgrade; mas version"
alias npmup="npm -v; npm -g outdated; npm -g update; npm -g prune; npm -g list --depth=0; npm -v"

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

##
# Source
##

# Load the shell dotfiles
for file in ~/.zsh-{exports,functions,aliases}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

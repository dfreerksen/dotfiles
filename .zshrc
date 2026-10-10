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

bindkey '^[[1;2D' backward-word   # Shift+Left
bindkey '^[[1;2C' forward-word    # Shift+Right

bindkey "^[[1;3D" backward-word   # Opt+Left
bindkey "^[[1;3C" forward-word    # Opt+Right

##
# Source
##

# Load the shell dotfiles
for file in ~/.zsh-{exports,functions,aliases}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

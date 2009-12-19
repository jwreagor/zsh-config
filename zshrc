##
# config ZSH
##

fpath=(~/.zsh/functions $fpath)

bindkey -e

setopt appendhistory autocd notify extendedglob mark_dirs prompt_subst

#if [ "$TERM" = "dumb" ]
#then
#  unsetopt zle
#  unsetopt prompt_cr
#  unsetopt prompt_subst
#  unfunction precmd
#  unfunction preexec
#  PS1='$ '
#fi

autoload -Uz compinit
compinit

autoload -U promptinit zrecompile
promptinit

autoload colors zsh/terminfo
  if [[ "$terminfo[colors]" -ge 8 ]]; then
  colors
fi
  
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
  eval export __$color='%{$terminfo[bold]$fg[${(L)color}]%}'
  eval export __LIGHT_$color='%{$fg[${(L)color}]%}'
  (( count = $count + 1 ))
done

zstyle :compinstall filename '/Users/justinwr/.zshrc'
zstyle ':completion::*:git*{name-rev,add,rm,co}:*' ignore-line true
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

export __RESET="%{%b%s%u$reset_color%}"
export __ZSH_CACHE=${HOME}/.zsh/.cache
export __ZSH_FUNCS=${HOME}/.zsh/functions
export __ZSH_SCRPT=${HOME}/.zsh/scripts

mkdir -p $__ZSH_CACHE

source ~/.zsh/env
source ~/.zsh/aliases
source ~/.zsh/functions/load
source ~/.zsh/scripts/load
source ~/.zsh/prompts/git-prompt

# rvm-install added line:
if [[ -s /Users/justin/.rvm/scripts/rvm ]] ; then source /Users/justin/.rvm/scripts/rvm ; fi


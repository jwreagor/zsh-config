plugins=(git osx gem brew bundler cap npm rvm)

bindkey -e

setopt appendhistory autocd notify extendedglob mark_dirs prompt_subst
unsetopt auto_name_dirs

source ~/.zsh/env
source ~/.zsh/aliases
source ~/.zsh/functions/load
source $ZSH/oh-my-zsh.sh

if [[ -s /Users/justin/.local-aliases ]]; then
    source /Users/justin/.local-aliases
fi

if [[ -s /usr/local/rvm/scripts/rvm ]]; then
    source /usr/local/rvm/scripts/rvm
fi

if [[ -s /Users/justin/.rvm/scripts/rvm ]]; then
    source /Users/justin/.rvm/scripts/rvm
fi

unsetopt correct correctall

plugins=(git osx gem brew bundler cap npm rvm zsh-syntax-highlighting)

bindkey -e

setopt appendhistory autocd notify extendedglob mark_dirs prompt_subst
unsetopt auto_name_dirs

source ~/.zsh/env
source ~/.zsh/aliases
source ~/.zsh/functions/load
source $ZSH/oh-my-zsh.sh

if [[ -s $HOME/.local-aliases ]]; then
    source $HOME/.local-aliases
fi

if [[ -s /usr/local/rvm/scripts/rvm ]]; then
    source /usr/local/rvm/scripts/rvm
fi

if [[ -s /Users/$(whoami)/.rvm/scripts/rvm ]]; then
    source /Users/$(whoami)/.rvm/scripts/rvm
fi

unsetopt correct correctall

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

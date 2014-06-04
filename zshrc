# -*-shell-script-*-

plugins=(git osx gem brew bundler cap npm rbenv zsh-syntax-highlighting)

bindkey -e

setopt appendhistory autocd notify extendedglob mark_dirs prompt_subst
unsetopt auto_name_dirs

source $HOME/.zsh/functions/git-deep
source $HOME/.zsh/functions/homebrew
source $HOME/.zsh/env
source $HOME/.zsh/aliases
source $ZSH/oh-my-zsh.sh
#source $HOME/.zsh/functions/autoload

if [[ -s $HOME/.local-aliases ]]; then
  source $HOME/.local-aliases
fi

if [[ -s /usr/local/rvm/scripts/rvm ]]; then
  source /usr/local/rvm/scripts/rvm
fi

if [[ -s /Users/$(whoami)/.rvm/scripts/rvm ]]; then
  source /Users/$(whoami)/.rvm/scripts/rvm
fi

if [[ -d $HOME/.nix-profile ]]; then
  source $HOME/.nix-profile/etc/profile.d/nix.sh
fi

unsetopt correct correctall

source "`brew --prefix grc`/etc/grc.bashrc"

eval "$(rbenv init -)"

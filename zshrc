# -*-shell-script-*-

plugins=(git osx gem brew brew-cask bundler cap npm rbenv capistrano \
  zsh-syntax-highlighting dirpersist)

bindkey -e

setopt aliases appendhistory autocd automenu completealiases extendedglob \
  globcomplete markdirs notify promptsubst recexact shwordsplit

unsetopt correct correctall auto_name_dirs

source $HOME/.zsh/functions/utils
source $HOME/.zsh/functions/homebrew
source $HOME/.zsh/env
source $HOME/.zsh/aliases
source $ZSH/oh-my-zsh.sh

unalias berks

[ -s $HOME/.local-aliases ] && source $HOME/.local-aliases
[ -d $HOME/.nix-profile ]   && source $HOME/.nix-profile/etc/profile.d/nix.sh

source "`brew --prefix grc`/etc/grc.bashrc"

eval "$(rbenv init -)" 1>&2

[ -s $HOME/.zdirs ] && cd - 2>/dev/null 1>&2

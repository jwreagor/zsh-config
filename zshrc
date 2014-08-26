# -*-shell-script-*-

plugins=(git osx gem brew brew-cask bundler cap npm rbenv capistrano \
  zsh-syntax-highlighting dirpersist)

bindkey -e

setopt aliases appendhistory autocd automenu completealiases extendedglob \
  globcomplete markdirs notify promptsubst recexact shwordsplit

unsetopt correct correctall auto_name_dirs

source $HOME/.zsh/styles
source $HOME/.zsh/functions/utils
source $HOME/.zsh/functions/homebrew
source $HOME/.zsh/env
source $HOME/.zsh/aliases
source $ZSH/oh-my-zsh.sh

unalias berks

[ -s $HOME/.local-aliases ] && source $HOME/.local-aliases
[ -d $HOME/.nix-profile ]   && source $HOME/.nix-profile/etc/profile.d/nix.sh

if which grc >/dev/null; then source "`brew --prefix grc`/etc/grc.bashrc"; fi
if which rbenv >/dev/null; then eval "$(rbenv init -)"; fi

[ -s $HOME/.zdirs ] && cd - >/dev/null

# -*-shell-script-*-

bindkey -e

setopt aliases appendhistory autocd automenu completealiases completeinword \
  extendedglob globcomplete histignoredups histignorespace markdirs \
  notify promptsubst recexact shwordsplit

unsetopt correct correctall autonamedirs

rubies=(/opt/rubies)
plugins=(brew brew-cask chruby dirpersist docker gem git knife knife-ssh npm osx vagrant zsh-syntax-highlighting)

source $HOME/.zsh/env
source $ZSH_BASE/functions/load
source $ZSH_BASE/styles
source $ZSH/oh-my-zsh.sh
source $ZSH_BASE/aliases
source $HOME/.local-aliases

[ -x $(which direnv) ] && eval "$(direnv hook zsh)"
[ -e $HOME/.nix-profile ] && source $HOME/.nix-profile/etc/profile.d/nix.sh

if [ -x brew-true ]; then
  brew-true awscli && source /usr/local/share/zsh/site-functions/_aws
  brew-true grc && source "`brew --prefix grc`/etc/grc.bashrc"
fi

[ -s $HOME/.zdirs ] && cd - >/dev/null

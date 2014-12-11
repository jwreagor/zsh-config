# -*-shell-script-*-

bindkey -e

setopt aliases appendhistory autocd automenu completealiases completeinword \
  extendedglob globcomplete histignoredups histignorespace markdirs \
  notify promptsubst recexact shwordsplit

unsetopt correct correctall autonamedirs

rubies+=(/opt/rubies)
plugins=(brew brew-cask chruby dirpersist
         gem git npm osx zsh-syntax-highlighting)

source $HOME/.zsh/styles
source $HOME/.zsh/functions/utils
source $HOME/.zsh/functions/homebrew
source $HOME/.zsh/env
source $ZSH/oh-my-zsh.sh
source $HOME/.zsh/aliases

eval "$(direnv hook zsh)"

[ -s $HOME/.local-aliases ] && source $HOME/.local-aliases
[ -d $HOME/.nix-profile ]   && source $HOME/.nix-profile/etc/profile.d/nix.sh
brew-true grc && source "`brew --prefix grc`/etc/grc.bashrc"
[ -s $HOME/.zdirs ] && cd - >/dev/null

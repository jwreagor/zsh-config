# -*-shell-script-*-

bindkey -e

setopt aliases appendhistory autocd automenu completealiases completeinword \
  extendedglob globcomplete histignoredups histignorespace markdirs \
  notify promptsubst recexact shwordsplit

unsetopt correct correctall autonamedirs

rubies=(/opt/rubies)
plugins=(brew brew-cask chruby dirpersist docker gem git npm osx zsh-syntax-highlighting)
zsources=(
  $HOME/.zsh/env
  $HOME/.zsh/functions/load
  $HOME/.zsh/styles
  $ZSH/oh-my-zsh.sh
  $HOME/.zsh/aliases
  $HOME/.local-aliases
)

for zsource in $zsources; do
  echo $zsource

  [ -e $zsource ] && source $zsource
done

[ -x $(which direnv) ] && eval "$(direnv hook zsh)"
[ -e $HOME/.nix-profile ] && source $HOME/.nix-profile/etc/profile.d/nix.sh

if [ -x brew-true ]; then
  brew-true awscli && source /usr/local/share/zsh/site-functions/_aws
  brew-true grc && source "`brew --prefix grc`/etc/grc.bashrc"
fi

[ -s $HOME/.zdirs ] && cd - >/dev/null

# -*-shell-script-*-

bindkey -e

setopt aliases appendhistory autocd automenu completealiases completeinword \
  extendedglob globcomplete histignoredups histignorespace markdirs \
  notify promptsubst recexact shwordsplit

unsetopt correct correctall autonamedirs

rubies=(/opt/rubies)
plugins=(brew brew-cask chruby dirpersist docker gem git knife knife-ssh npm nvm osx python pip vagrant zsh-syntax-highlighting)

[ -f $HOME/.zsh/env ] && source $HOME/.zsh/env
[ -f $ZSH_BASE/functions/load ] && source $ZSH_BASE/functions/load
[ -f $ZSH_BASE/styles ] && source $ZSH_BASE/styles
[ -f $ZSH/oh-my-zsh.sh ] && source $ZSH/oh-my-zsh.sh
[ -f $ZSH_BASE/aliases ] && source $ZSH_BASE/aliases
[ -f $HOME/.local-aliases ] && source $HOME/.local-aliases
[ -x $(which direnv) ] && eval "$(direnv hook zsh)"
[ -e $HOME/.nix-profile ] && source $HOME/.nix-profile/etc/profile.d/nix.sh
[ -e $HOME/.cargo/env ] && source $HOME/.cargo/env &>/dev/null

if [ -x brew-true ]; then
  brew-true awscli && source /usr/local/share/zsh/site-functions/_aws
  brew-true grc && source "`brew --prefix grc`/etc/grc.bashrc"
  brew-true nvm && source "$(brew --prefix nvm)/nvm.sh"
fi

[ -s $HOME/.zdirs ] && cd - &>/dev/null

[ -f /Users/justin/.travis/travis.sh ] && source /Users/justin/.travis/travis.sh

[ -f /usr/local/opt/nvm/nvm.sh ] && source /usr/local/opt/nvm/nvm.sh

#if [ -f /Users/justin/.triton.completion ]; then
#  bashcompinit
#  source ~/.triton.completion
#fi

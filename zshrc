# -*-shell-script-*-

plugins=(git osx gem brew brew-cask bundler cap npm rbenv capistrano zsh-syntax-highlighting dirpersist)

bindkey -e

setopt appendhistory autocd notify extendedglob mark_dirs prompt_subst
unsetopt correct correctall auto_name_dirs

source $HOME/.zsh/styles
source $HOME/.zsh/functions/homebrew
source $HOME/.zsh/env
source $HOME/.zsh/aliases
source $ZSH/oh-my-zsh.sh
#source $HOME/.zsh/functions/autoload

[ -s $HOME/.local-aliases ] && source $HOME/.local-aliases
[ -d $HOME/.nix-profile ] && source $HOME/.nix-profile/etc/profile.d/nix.sh

if which grc >/dev/null; then source "`brew --prefix grc`/etc/grc.bashrc"; fi
if which rbenv >/dev/null; then eval "$(rbenv init -)"; fi

[ -s $HOME/.zdirs ] && cd - 2>/dev/null 1>&2

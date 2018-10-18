#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o xtrace

#
# it is not necessary to change
# survival is not mandatory
#

if [ "$platform" = "osx" ]; then
  brew tap homebrew/bundle
  brew bundle

  # Settings > Keyboard > Shortcuts > Override Paste with "Paste and Match Style"
  # Settings > Keyboard > Shortcuts > All controls
else if [ "$platform" = "linux" ]; then
   echo "Install zsh and emacs24-nox"
   sudo apt-get install -y \
        direnv \
        emacs-nox \
        git \
        silversearcher-ag \
        tmux \
        zsh
fi

if [ ! -d "${HOME}/.zsh" ]; then
  cd $HOME
  git clone git@github.com:cheapRoc/zsh-config.git $HOME/.zsh
fi

if [ ! -d "${HOME}/.oh-my-zsh" ]; then
  cd $HOME
  git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
fi

ln -s $HOME/.zsh/zshrc $HOME/.zshrc
ln -s $HOME/.zsh/tmux.conf $HOME/.tmux.conf
#ln -s $HOME/.zsh/pryrc $HOME/.pryrc
#ln -s $HOME/.zsh/irbrc $HOME/.irbrc
#ln -s $HOME/.zsh/ccl-init.lisp $HOME/.ccl-init.lisp
#ln -s $HOME/.zsh/ackrc $HOME/.ackrc
#ln -s $HOME/.zsh/mpd $HOME/.mpd
#ln -s $HOME/.zsh/ncmpcpp $HOME/.ncmpcpp

if [ ! -d "${HOME}/.emacs.d" ]; then
  cd $HOME
  git clone git@github.com:cheapRoc/emacs-config.git $HOME/.emacs.d
  cd .emacs.d
fi

## init go coding deps
if [ -x "$(which go)" ]; then
  go get -u github.com/rogpeppe/godef
  go get -u github.com/mdempsky/gocode
  go get -u golang.org/x/tools/cmd/guru
  go get -u golang.org/x/tools/cmd/goimports
fi

if [ -x "${WITH_NODE}" ]; then
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.4/install.sh | bash
    # npm install -g diff-so-fancy
fi

if [ -x "${WITH_RUBY}" ]; then
    local __chruby_version=0.3.9
    wget -O chruby-${__chruby_version}.tar.gz https://github.com/postmodern/chruby/archive/v${__chruby_version}.tar.gz
    tar -xzvf chruby-${__chruby_version}.tar.gz
    cd chruby-${__chruby_version}/
    sudo make install

    local __rins_version=0.6.1
    wget -O ruby-install-${__rins_version}.tar.gz https://github.com/postmodern/ruby-install/archive/v${__rins_version}.tar.gz
    tar -xzvf ruby-install-${__rins_version}.tar.gz
    cd ruby-install-${__rins_version}/
    sudo make install
fi

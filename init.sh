#!/usr/bin/env zsh
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
   sudo apt-get install zsh emacs24-nox
fi

# clone zsh-config
if [ ! -d "~/.zsh" ]; then
  cd ~
  git clone git@github.com:cheapRoc/zsh-config.git
fi

# pull down .oh-my-zsh
if [ ! -d "~/.oh-my-zsh" ]; then
  cd ~
  git clone https://github.com/robbyrussell/oh-my-zsh.git .oh-my-zsh
fi

ln -s $HOME/.zsh/zshrc $HOME/.zshrc
ln -s $HOME/.zsh/tmux.conf $HOME/.tmux.conf
ln -s $HOME/.zsh/pryrc $HOME/.pryrc
ln -s $HOME/.zsh/irbrc $HOME/.irbrc
ln -s $HOME/.zsh/gitignore $HOME/.gitignore
ln -s $HOME/.zsh/gitconfig $HOME/.gitconfig
ln -s $HOME/.zsh/ccl-init.lisp $HOME/.ccl-init.lisp
ln -s $HOME/.zsh/ackrc $HOME/.ackrc
ln -s $HOME/.zsh/mpd $HOME/.mpd
ln -s $HOME/.zsh/ncmpcpp $HOME/.ncmpcpp

# pull down emacs-config
if [ ! -d "~/.emacs.d" ]; then
  cd ~
  git clone git@github.com:cheapRoc/emacs-config.git .emacs.d/
  cd .emacs.d
  git submodule update --init
fi

# nvm install
# curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.4/install.sh | bash

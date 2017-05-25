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
   sudo apt-get install zsh direnv emacs24-nox
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
ln -s $HOME/.zsh/pryrc $HOME/.pryrc
ln -s $HOME/.zsh/irbrc $HOME/.irbrc
ln -s $HOME/.zsh/gitignore $HOME/.gitignore
ln -s $HOME/.zsh/gitconfig $HOME/.gitconfig
#ln -s $HOME/.zsh/ccl-init.lisp $HOME/.ccl-init.lisp
#ln -s $HOME/.zsh/ackrc $HOME/.ackrc
#ln -s $HOME/.zsh/mpd $HOME/.mpd
#ln -s $HOME/.zsh/ncmpcpp $HOME/.ncmpcpp

if [ ! -d "${HOME}/.emacs.d" ]; then
  cd $HOME
  git clone git@github.com:cheapRoc/emacs-config.git $HOME/.emacs.d
  cd .emacs.d
fi

# init nvm
# curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.4/install.sh | bash

# init chruby
# wget -O chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz
# tar -xzvf chruby-0.3.9.tar.gz
# cd chruby-0.3.9/
# sudo make install

# init ruby-install
# wget -O ruby-install-0.6.1.tar.gz https://github.com/postmodern/ruby-install/archive/v0.6.1.tar.gz
# tar -xzvf ruby-install-0.6.1.tar.gz
# cd ruby-install-0.6.1/
# sudo make install

# npm install -g diff-so-fancy

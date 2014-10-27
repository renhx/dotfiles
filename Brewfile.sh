#!/bin/bash

#Setup
brew update

#Shell
brew install bash-completion
brew install fish --HEAD
brew install zsh
brew install zsh-completions
brew install tmux
brew install tmux-mem-cpu-load
brew install rainbarf
brew install reattach-to-user-namespace
brew install mobile-shell

#Fonts
brew tap sanemat/font
brew install ricty --vim-powerline
# cp -f /PATH/TO/RICTY/fonts/Ricty*.ttf ~/Library/Fonts/
# fc-cache -vf

#Langs
brew install lua
brew install luajit
brew install go
brew install rbenv ruby-build
brew install pyenv
brew install nodebrew
brew install mono

#misc.
brew install git
brew install tig
brew install hub
brew install tree
brew install watch
brew install wget
brew install htop
brew install macvim --with-cscope --with-luajit --HEAD # ln -s /usr/local/Cellar/macvim/HEAD/MacVim.app /Applications
brew install openssl
brew install ngrok
brew install ino

brew tap peco/peco
brew install peco
brew install migemogrep

#Pentest
brew install sqlmap
brew install nmap
brew install hping
brew install dex2jar
brew install apktool
#procyon

#Teardown
brew cleanup
brew linkapps

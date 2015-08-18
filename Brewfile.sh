#!/bin/bash

#Setup
brew update
brew install caskroom/cask/brew-cask

#Shell
brew install coreutils
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
brew tap caskroom/fonts
brew cask install font-myrica

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
brew install ghc cabal-install
cabal update
cabal install happy
cabal install ghc-mod

#misc.
brew install git
brew install tig
brew install hub
brew install gist
brew cask install github-desktop
brew install mercurial
brew install tree
brew install watch
brew install wget
brew install htop
brew install macvim --with-cscope --with-luajit --HEAD # ln -s /usr/local/Cellar/macvim/HEAD/MacVim.app /Applications
brew install openssl
brew install ngrok
brew install ino
brew install ctags
brew install heroku-toolbelt

brew install cmigemo --HEAD
brew tap peco/peco
brew install peco
brew install migemogrep

brew tap uetchy/nlp

#Pentest
brew install sqlmap --HEAD
brew install nmap
brew install hping
brew install dex2jar
brew install apktool
#procyon
brew install exiftool

brew tap homebrew/binary
brew install jad

#Teardown
brew cleanup
brew linkapps

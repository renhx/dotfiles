#!/bin/bash

#Setup
brew update
brew tap caskroom/cask
# brew install caskroom/cask/brew-cask

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
# brew cask install java
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
#sudo npm install -g vtop

#Development
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
brew install the_silver_searcher #高速検索, `ag -a hoge ~/dotfiles/`, -uで全ファイル対象
brew install prettyping

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
brew install apktool # brew cask install java
brew install procyon-decompiler
brew cask install jd-gui
brew install exiftool
brew install sslyze
# brew install binwalk
brew cask install 0xed
# brew install hashpump
# brew cask install wireshark #未検証
# brew install john-jumbo
# brew install pdfcrack
brew cask install ifunbox

brew tap homebrew/binary
brew install jad

#Misc
brew install asciinema     # ターミナルの録画
brew install imagemagick   # 画像ファイルの変換
brew install ghostscript   # PDFファイルの変換
brew install kindlegen     # opfやePubをkindleフォーマットに変換
brew cask install send-to-kindle
brew cask install licecap  # GIFアニメ作成
brew cask install keycastr # キーストローク表示
brew cask install inkscape # Illustratorの代替品
brew cask install soundnode # SoundCloud App for Mac
brew cask install amazon-music
brew cask install yubikey-personalization-gui
brew cask install spotify

#OSX Basic
# brew cask install xquartz
# brew cask install bettertouchtool
# brew cask install karabiner
# brew cask install alfred
# brew cask install caffeine
# brew cask install arduino
# brew cask install dropbox
# brew cask install iterm2
# brew cask install virtualbox
# brew cask install google-chrome
# brew cask install google-japanese-ime
brew cask install smoothmouse

#Teardown
brew cleanup
brew linkapps

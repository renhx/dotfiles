# dotfiles [![Build Status](https://travis-ci.org/renhx/dotfiles.svg?branch=master)](https://travis-ci.org/renhx/dotfiles)
tmux + fish-shell + vim + etc 🐱

## Requirements
### OSX
```bash
xcode-select --install
```

## Install
```bash
git clone https://github.com/renhx/dotfiles.git && cd dotfiles
make
```

```bash
# About Shell
make fish       # fish-shellを使う時
make zsh-append # 既存のzsh環境にaliasやPATHを寄生させる時(RS2等)
make bash       # bashを使う時
```

## Screencast
[![asciicast](https://asciinema.org/a/a5i1h1u2idthkd2t04izm2gri.png)](https://asciinema.org/a/a5i1h1u2idthkd2t04izm2gri)

## scripts/*.sh
~/usr/local/以下にユーザ権限でインストール。

```
export PATH=$HOME/usr/local/bin/:$PATH
export LD_LIBRARY_PATH=$HOME/usr/local/lib/:$LD_LIBRARY_PATH
```

* install_mosh_to_home.sh
* install_rainbarf_to_home.sh
  * tmuxのステータスバー用ビジュアライザ
* install_tig_to_home.sh
* install_tmux_to_home.sh
* install_tree_to_home.sh
* install_vim_to_home.sh
  * +if_luaなvim

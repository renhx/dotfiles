# dotfiles
## Usage
```bash
git clone https://github.com/renhx/dotfiles.git && cd dotfiles
make
```

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

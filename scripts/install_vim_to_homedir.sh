#!/bin/bash
# 学部鯖等, ユーザ権限しかないサーバで+if_luaなvimを入れたい時
# ~/usr/local/ 以下にインストールする。

#make ~/usr/local/
if [ ! -d $HOME/usr/local/ ]; then
  mkdir -p $HOME/usr/local/
fi
mkdir tmp_install_vim_to_homedir && cd tmp_install_vim_to_homedir

#install lua
wget http://www.lua.org/ftp/lua-5.2.3.tar.gz
tar xzf lua-5.2.3.tar.gz
cd lua-5.2.3
make linux && make install INSTALL_TOP=$HOME/usr/local
cd ..

#install vim
git clone https://github.com/vim-jp/vim.git
cd vim
LDFLAGS="-L$HOME/usr/local/lib/" ./configure --prefix=$HOME/usr/local --with-local-dir=$HOME/usr/local --with-features=huge --enable-multibyte --disable-darwin --disable-selinux --enable-pythoninterp --enable-luainterp=yes --with-lua-prefix=$HOME/usr/local --enable-cscope --enable-perlinterp --enable-fail-if-missing && make && make install
cd ..

echo "you need to add 'export PATH=$HOME/usr/local/bin/:$PATH'"
echo "you need to add 'export LD_LIBRARY_PATH=$HOME/usr/local/lib/:$LD_LIBRARY_PATH'"

#!/bin/bash
# ~/usr/local 以下にtmuxをインストールする

#make ~/usr/local/
if [ ! -d $HOME/usr/local/ ]; then
  mkdir -p $HOME/usr/local/
fi
mkdir tmp_install_tmux_to_home && cd tmp_install_tmux_to_home

#install libevent
wget http://sourceforge.net/projects/levent/files/libevent/libevent-2.0/libevent-2.0.21-stable.tar.gz
tar zxvf libevent-2.0.21-stable.tar.gz
cd libevent-2.0.21-stable
./configure --prefix=$HOME/usr/local && make && make install
cd ..

#install ncurses
wget http://ftp.gnu.org/pub/gnu/ncurses/ncurses-5.9.tar.gz
tar zxvf ncurses-5.9.tar.gz
cd ncurses-5.9
./configure --prefix=$HOME/usr/local && make && make install
cd ..

#install tmux
wget http://downloads.sourceforge.net/tmux/tmux-1.9a.tar.gz
tar xvzf tmux-1.9a.tar.gz
cd tmux-1.9a
LIBEVENT_CFLAGS="-I$HOME/usr/local/include" LIBEVENT_LIBS="-L$HOME/usr/local/lib -levent" ./configure --prefix=$HOME/usr/local && make && make install
cd ..

echo '--------------------------'
echo 'YOU NEED TO ADD "export PATH=$HOME/usr/local/bin/:$PATH"'
echo 'YOU NEED TO ADD "export LD_LIBRARY_PATH=$HOME/usr/local/lib/:$LD_LIBRARY_PATH"'
echo '--------------------------'

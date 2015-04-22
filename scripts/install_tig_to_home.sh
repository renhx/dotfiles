#!/bin/bash
# ~/usr/local 以下にtigをインストールする

#make ~/usr/local/
if [ ! -d $HOME/usr/local/ ]; then
  mkdir -p $HOME/usr/local/
fi
mkdir tmp_install_tig_to_home && cd tmp_install_tig_to_home

#install ncurses
wget http://ftp.gnu.org/pub/gnu/ncurses/ncurses-5.9.tar.gz
tar zxvf ncurses-5.9.tar.gz
cd ncurses-5.9
./configure --prefix=$HOME/usr/local && make && make install
if [ $? -ne 0 ]; then
    echo "Error: ncurses"; exit 1
fi
cd ..

#install tig
git clone https://github.com/jonas/tig.git && cd tig
LIBEVENT_CFLAGS="-I$HOME/usr/local/include" LIBEVENT_LIBS="-L$HOME/usr/local/lib -levent" ./autogen.sh && ./configure --prefix=$HOME/usr/local && make install
if [ $? -ne 0 ]; then
    echo "Error: tig"; exit 1
fi
cd ..

cd .. && echo ''
echo '--------------------------'
echo 'Append the following lines...'
echo 'export PATH=$HOME/usr/local/bin/:$PATH'
echo 'export LD_LIBRARY_PATH=$HOME/usr/local/lib/:$LD_LIBRARY_PATH'
echo '--------------------------'

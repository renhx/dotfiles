#!/bin/bash
# ~/usr/local 以下にmoshをインストールする

#make ~/usr/local/
if [ ! -d $HOME/usr/local/ ]; then
  mkdir -p $HOME/usr/local/
fi
mkdir tmp_install_mosh_to_home && cd tmp_install_mosh_to_home

#install protobuf
git clone https://github.com/google/protobuf.git
cd protobuf/
./autogen.sh && ./configure --prefix=$HOME/usr/local && make && make install
if [ $? -ne 0 ]; then
    echo "Error: protobuf"; exit 1
fi
cd ..

#install mosh
git clone https://github.com/keithw/mosh
cd mosh
./autogen.sh && CXXFLAGS="-I$HOME/usr/local/include" CFLAGS="-I$HOME/usr/local/include" LDFLAGS="-L$HOME/usr/local/lib" PKG_CONFIG_PATH=$HOME/usr/local/lib/pkgconfig ./configure --prefix=$HOME/usr/local/ && make && make install
if [ $? -ne 0 ]; then
    echo "Error: mosh"; exit 1
fi
cd ..

cd .. && echo ''
echo '--------------------------'
echo 'Append the following lines...'
echo 'export PATH=$HOME/usr/local/bin/:$PATH'
echo 'export LD_LIBRARY_PATH=$HOME/usr/local/lib/:$LD_LIBRARY_PATH'
echo '--------------------------'

#!/bin/bash
# ~/usr/local 以下にtigをインストールする

#make ~/usr/local/
if [ ! -d $HOME/usr/local/ ]; then
  mkdir -p $HOME/usr/local/
fi
mkdir tmp_install_tig_to_home && cd tmp_install_tig_to_home

#install tig
git clone https://github.com/jonas/tig.git && cd tig
./autogen.sh && ./configure --prefix=$HOME/usr/local && make install
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

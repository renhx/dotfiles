#!/bin/bash
# ~/usr/local 以下にrainbarfをインストールする

#make ~/usr/local/
if [ ! -d $HOME/usr/local/ ]; then
  mkdir -p $HOME/usr/local/
fi
mkdir tmp_install_rainbarf_to_home && cd tmp_install_rainbarf_to_home

git clone https://github.com/creaktive/rainbarf.git && cd rainbarf
cp ./rainbarf $HOME/usr/local/bin/
if [ $? -ne 0 ]; then
    echo "Error: rainbarf"; exit 1
fi
cd ..

cd .. && echo ''
echo '--------------------------'
echo 'Append the following lines...'
echo 'export PATH=$HOME/usr/local/bin/:$PATH'
echo 'export LD_LIBRARY_PATH=$HOME/usr/local/lib/:$LD_LIBRARY_PATH'
echo '--------------------------'

#!/bin/bash
# ~/usr/local 以下にtreeをインストールする

#make ~/usr/local/
if [ ! -d $HOME/usr/local/ ]; then
  mkdir -p $HOME/usr/local/
fi
mkdir tmp_install_tree_to_home && cd tmp_install_tree_to_home

#install tree
wget http://mama.indstate.edu/users/ice/tree/src/tree-1.7.0.tgz
tar xvzf tree-1.7.0.tgz && cd tree-1.7.0/
make prefix=$HOME/usr/local install
if [ $? -ne 0 ]; then
    echo "Error: tree"; exit 1
fi
cd ..

cd .. && echo ''
echo '--------------------------'
echo 'Append the following lines...'
echo 'export PATH=$HOME/usr/local/bin/:$PATH'
echo 'export LD_LIBRARY_PATH=$HOME/usr/local/lib/:$LD_LIBRARY_PATH'
echo '--------------------------'

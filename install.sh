#!/bin/bash


apt-get update && apt-get install -y python-dev exuberant-ctags vim-nox

# for Mac OSX
# brew install vim --with-lua

# for python pip
mkdir ~/.pip && cp pip.conf ~/.pip/
wget https://bootstrap.pypa.io/get-pip.py && python get-pip.py && rm -f get-pip.py
pip install virtualenv

# tmux conf
cp tmux.conf ~/.tmux.conf

# for spf13 vim
cp .vimrc.before.local  ~/
cp .vimrc.bundles.local ~/
cp .vimrc.local ~/
# http://j.mp/spf13-vim3
curl https://raw.githubusercontent.com/spf13/spf13-vim/3.0/bootstrap.sh -L -o - | sh

#!/bin/bash


apt-get update && apt-get install -y python-dev exuberant-ctags vim-nox

# for Mac OSX
# brew install vim --with-lua

# for python pip
mkdir ~/.pip && cp pip.conf ~/.pip/
wget https://bootstrap.pypa.io/get-pip.py > /tmp/get-pip.py
python /tmp/get-pip.py
pip install virtualenv

# for spf13 vim
cp .vimrc.before.local  ~/
cp .vimrc.bundles.local ~/
cp .vimrc.local ~/
curl http://j.mp/spf13-vim3 -L -o - | sh


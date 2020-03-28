#!/bin/bash

__ScriptVersion="1.0"

#===  FUNCTION  ================================================================
#         NAME:  usage
#  DESCRIPTION:  Display usage information.
#===============================================================================
usage() {
    echo "Usage :  $0 [options] [--]

    Options:
    -h|help       Display this message
    -v|version    Display script version
    -i|init       Init vim envirment
    -u|update     Update vim conf"

}    # ----------  end of function usage  ----------

init() {
    # apt-get update && apt-get install -y python-dev exuberant-ctags build-essential cmake
    brew install cmake

    # if use neocomplete, install below
    # vim-nox for ubuntu
    # for Mac OSX
    # brew install vim --with-lua

    # for python pip
    mkdir ~/.pip && cp pip.conf ~/.pip/
    curl https://bootstrap.pypa.io/get-pip.py -L -o - | sudo python
    pip install virtualenv

    # tmux conf
    cp tmux.conf ~/.tmux.conf

    # forir spf13 vim
    cp .vimrc.before.local  ~/
    cp .vimrc.bundles.local ~/
    cp .vimrc.local ~/
    # http://j.mp/spf13-vim3
    curl https://raw.githubusercontent.com/spf13/spf13-vim/3.0/bootstrap.sh -L -o - | sh

    # YCM

    # git clone --recursive https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
    # # download clang manually
    # ~/.vim/bundle/YouCompleteMe/third_party/ycmd/clang_archives
    # # build
    # cd ~/.vim/bundle/YouCompleteMe
    # http_proxy=127.0.0.1:1087 python3 install.py --clang-completer --gocode-completer

    # # updata YCM
    # git submodule update --recursive --remote
}

update() {
    cp .vimrc.before.local  ~/
    cp .vimrc.bundles.local ~/
    cp .vimrc.local ~/
}


#-----------------------------------------------------------------------
#  Handle command line arguments
#-----------------------------------------------------------------------

while getopts ":hviu" opt
do
  case $opt in

    h|help     )  usage; exit 0   ;;

    v|version  )  echo "$0 -- Version $__ScriptVersion"; exit 0   ;;

    i|init     )  init; exit 0   ;;

    u|update   )  update; exit 0   ;;

    * )  usage; exit 1   ;;

  esac    # --- end of case ---
done
shift $(($OPTIND-1))

#!/bin/bash

__ScriptVersion="1.0"

#===  FUNCTION  ================================================================
#         NAME:  usage
#  DESCRIPTION:  Display usage information.
#===============================================================================
function usage ()
{
    echo "Usage :  $0 [options] [--]

    Options:
    -h|help       Display this message
    -v|version    Display script version
    -i|init       Init vim envirment
    -u|update     Update vim conf"

}    # ----------  end of function usage  ----------

function init()
{
    apt-get update && apt-get install -y python-dev exuberant-ctags vim-nox
    # for Mac OSX
    # brew install vim --with-lua

    # for python pip
    mkdir ~/.pip && cp pip.conf ~/.pip/
    wget https://bootstrap.pypa.io/get-pip.py && python get-pip.py && rm -f get-pip.py
    pip install virtualenv

    # tmux conf
    cp tmux.conf ~/.tmux.conf

    # forir spf13 vim
    cp .vimrc.before.local  ~/
    cp .vimrc.bundles.local ~/
    cp .vimrc.local ~/
    # http://j.mp/spf13-vim3
    curl https://raw.githubusercontent.com/spf13/spf13-vim/3.0/bootstrap.sh -L -o - | sh
}

function update()
{
    cp .vimrc.before.local  ~/
    cp .vimrc.bundles.local ~/
    cp .vimrc.local ~/
}


#-----------------------------------------------------------------------
#  Handle command line arguments
#-----------------------------------------------------------------------

while getopts ":hv" opt
do
  case $opt in

    h|help     )  usage; exit 0   ;;

    v|version  )  echo "$<`0:0`> -- Version $__ScriptVersion"; exit 0   ;;

    i|init     )  init; exit 0   ;;

    u|update     )  update; exit 0   ;;

    * )  echo -e "\n  Option does not exist : $OPTARG\n"
          usage; exit 1   ;;

  esac    # --- end of case ---
done
shift $(($OPTIND-1))

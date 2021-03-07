### Plugins Installation

启动VIM：

```
http_proxy=127.0.0.1:1087 vim
```

Bundle管理插件，需要在VIM中执行：

```
# update
:BundleUpdate

# install
:BundleInstall
```

YCM安装可能有问题，参考以下步骤：
```
git clone --recursive https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe

# download clang manually if needed
cd ~/.vim/bundle/YouCompleteMe/third_party/ycmd/clang_archives

# build
# please check this if using macOS <=10.14, https://github.com/ycm-core/YouCompleteMe/issues/3805#issuecomment-72764302
cd ~/.vim/bundle/YouCompleteMe
http_proxy=127.0.0.1:1087 python3 install.py --clang-completer --gocode-completer

# init YCM submodules
git submodule update --init --recursive

# deinit YCM submodules
git submodule deinit --all -f

# updata YCM
git submodule update --recursive --remote

```


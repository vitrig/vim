# My personal vim configuration with plugins

This repository hosts my personal vim configuration and plugins that i use.

#Installation

##Unix
```bash
git clone http://github.com/vitrig/vim ~/.vim
cp ~/.vim/.vimrc ~/.vimrc
```

##Windows
```
git clone http://github.com/vitrig/vim {VIM_DIRECTORY_ON_WINDOWS_SYSTEM}/vimfiles
cp {VIM_DIRECTORY_ON_WINDOWS_SYSTEM}/.vimrc {VIM_DIRECTORY_ON_WINDOWS_SYSTEM}/_vimrc
```

.vimrc just sources config.vim file which is located in .vim(or vimfiles on Windows) directory.
This way changes can be made to config.vim, plugins can be installed and they are all recorded
by git - they can be synchronized with many machines on which I use vim

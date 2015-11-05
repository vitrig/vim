# My personal Vim setup
[!pic](0.png)
This repository hosts my personal vim configuration and required plugins. Currently it contains following plugins:

- pathogen
- auto-pairs
- bufexplorer
- ctrlp.vim
- flattown
- fonts
- nerdtree
- seti.vim
- ultisnips
- vim-airline
- vim-bbye
- vim-easymotion
- vim-less
- vim-skeletons
- vim-snippets
- vim-twig
- seti.vim


.vimrc file just sources config.vim file, which is located in Vim home directory along with plugins.
This way changes can be made to config.vim, new plugins can be installed or new Vim snippets can be created - every change can be quickly commited back to git repository. It just takes `git pull` To synchronize configuration with another workstation.


#Installation

###Unix
```bash
git clone http://github.com/vitrig/.vim ~/.vim && ~/.vim/install.sh
```

###Windows
```
git clone http://github.com/vitrig/.vim {VIM_DIRECTORY_ON_WINDOWS_SYSTEM}/vimfiles
cp {VIM_DIRECTORY_ON_WINDOWS_SYSTEM}/.vimrc {VIM_DIRECTORY_ON_WINDOWS_SYSTEM}/_vimrc
```

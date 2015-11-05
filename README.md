# My personal Vim setup

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
This way changes can be made to config.vim, plugins can be installed and all this changes quickly can be commited
back to git repository, so they can be synchronized with many machines with Vim


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

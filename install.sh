#!/bin/bash
DIR=$(cd "$(dirname "$0")" && pwd)

if [ "$?" -ne "0" ]; then
    echo Can\'t determine script location
    exit 1;
fi

if ! "$DIR/bundle/fonts/install.sh" 2> /dev/null; then
    echo "Cannot install powerline fonts. Vim will work without them"
fi

cp -vf "$DIR/.vimrc" ~/.vimrc

true ${XDG_CONFIG_HOME:=$HOME/.config}

if mkdir -vp $XDG_CONFIG_HOME 2> /dev/null; then
    ln -v -s ~/.vim $XDG_CONFIG_HOME/nvim
    ln -v -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
else
    echo "Cannot create directory for neovim configuration ($XDG_CONFIG_HOME) "
    echo "Not a big problem, but this configuration will not work with neovim"
fi

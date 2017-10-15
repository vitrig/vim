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





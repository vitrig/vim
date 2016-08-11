#!/bin/bash
DIR=$(cd "$(dirname "$0")" && pwd)

if [ "$?" -ne "0" ]; then
    echo Can\'t determine script location
    exit 1;
fi

cp -vf "$DIR/.vimrc" ~/.vimrc





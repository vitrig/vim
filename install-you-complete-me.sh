#!/bin/bash

main () {
    rm -fr bundle/YouCompleteMe
    git clone https://github.com/Valloric/YouCompleteMe bundle/YouCompleteMe --recursive && {
        cd bundle/YouCompleteMe
        git checkout c9ff2177377a85515b7e081966685f3c46a33eca
        ./install.py --clang-completer --system-libclang
    }
}

main "$@"

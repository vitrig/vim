if has('win32') || has ('win64')
    let $VIMHOME = $VIM."/vimfiles"
else
    let $VIMHOME = $HOME."/.vim"
endif

"Outsourcing this config to different location
"Allows us to keep all vim configuration
"in VIMHOME directory, thus allowing to keep
"ALL configuration, plugins, ..., in git repo :)
source $VIMHOME/config.vim


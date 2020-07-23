set ts=8 sw=8 noexpandtab

let g:switch_custom_definitions =
    \ [
    \    [ '->', '.' ],
    \    {
    \        '\v^(.*)ret \= (PON_ADAPTER_[A-Z]+);': '\1return \2;',
    \        '\v^(.*)return (PON_ADAPTER_[A-Z]+);': '\1ret = \2;',
    \    }
    \ ]

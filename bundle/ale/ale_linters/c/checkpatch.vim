" Author: Krzysztof Bembnista <krzysztof.bembnista@gmail.com>
" Description: checkpatch linter for c files

call ale#Set('c_checkpatch_executable', 'checkpatch.pl')
call ale#Set('c_checkpatch_options', '--strict')

function! ale_linters#c#checkpatch#GetExecutable(buffer) abort
    return ale#Var(a:buffer, 'c_checkpatch_executable')
endfunction

function! ale_linters#c#checkpatch#GetCommand(buffer) abort
    return ale#Escape(ale_linters#c#checkpatch#GetExecutable(a:buffer))
    \   . ' -f --no-tree --terse --color=never --no-summary '
    \   . ale#Var(a:buffer, 'c_checkpatch_options')
    \   . ' %t'
endfunction

call ale#linter#Define('c', {
\   'name': 'checkpatch',
\   'output_stream': 'stdout',
\   'executable_callback': 'ale_linters#c#checkpatch#GetExecutable',
\   'command_callback': 'ale_linters#c#checkpatch#GetCommand',
\   'callback': 'ale#handlers#checkpatch#HandleCheckpatchFormat',
\})

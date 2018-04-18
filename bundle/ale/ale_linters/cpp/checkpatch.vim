" Author: Krzysztof Bembnista <krzysztof.bembnista@gmail.com>
" Description: checkpatch linter for cpp files

call ale#Set('cpp_checkpatch_executable', 'checkpatch.pl')
call ale#Set('cpp_checkpatch_options', '--strict')

function! ale_linters#cpp#checkpatch#GetExecutable(buffer) abort
    return ale#Var(a:buffer, 'cpp_checkpatch_executable')
endfunction

function! ale_linters#cpp#checkpatch#GetCommand(buffer) abort
    return ale#Escape(ale_linters#cpp#checkpatch#GetExecutable(a:buffer))
    \   . ' -f --no-tree --terse --color=never --no-summary '
    \   . ale#Var(a:buffer, 'cpp_checkpatch_options')
    \   . ' %t'
endfunction

call ale#linter#Define('cpp', {
\   'name': 'checkpatch',
\   'output_stream': 'stdout',
\   'executable_callback': 'ale_linters#cpp#checkpatch#GetExecutable',
\   'command_callback': 'ale_linters#cpp#checkpatch#GetCommand',
\   'callback': 'ale#handlers#checkpatch#HandleCheckpatchFormat',
\})

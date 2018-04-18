" Description: Handle errors for checkpatch.

function! ale#handlers#checkpatch#HandleCheckpatchFormat(buffer, lines) abort
    " Look for lines like the following.
    "
    " [test.cpp:5]: (error) Array 'a[10]' accessed at index 10, which is out of bounds
    " freertos/FreeRTOS/Source/queue.c:2916: WARNING: line over 80 characters
    let l:pattern = '\v^(.+):(\d+): ([A-Z]+): (.+)$'
    let l:output = []

    for l:match in ale#util#GetMatches(a:lines, l:pattern)
        if ale#path#IsBufferPath(a:buffer, l:match[1])
            call add(l:output, {
            \   'lnum': str2nr(l:match[2]),
            \   'type': l:match[3] is# 'ERROR' ? 'E' : 'W',
            \   'text': l:match[4],
            \})
        endif
    endfor

    return l:output
endfunction

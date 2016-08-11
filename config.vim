"Required plugins:
"pathogen -- first and foremost

"Map leader to space
"It is more reachable
let mapleader = " "

"Pathogen is used to allow installation
"of custom plugins easily
execute pathogen#infect() 

"Disable compatible mode
set nocompatible

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

set backspace=indent,eol,start
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

"Prevent vim from generating crapfiles
set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile     "no swap filese
set noundofile     "no undo files

"Remove some unnecessary options from gui versions of vim
set guioptions-=m "remove menu bar
set guioptions-=T "remove toolbar
set guioptions-=r "remove right-hand scroll bar
set guioptions-=L "remove left-hand scroll bar

set number "display line numbers

"disable beeping
set noerrorbells visualbell t_vb=
if has('autocmd')
    autocmd GUIEnter * set visualbell t_vb=
endif

" Colorscheme settings
syntax enable "enable syntax highlighting

colorscheme monokai "set colorscheme
let g:airline_theme='monokai' "set airline colorscheme

" Colorscheme fixes
highlight nonText ctermbg=NONE  "make background consistent
highlight CursorLine cterm=NONE "remove underline from CursorLine
set fillchars=vert:\ "remove ugly vertical line characters '|' which are visible on some colorschemes


set tabstop=4
set shiftwidth=4
set expandtab

filetype on
filetype plugin on 
filetype indent on

set cino=is,(s,m1,N-s,g0

"The encoding displayed.
set encoding=utf-8 

"The encoding written to file. 
set fileencoding=utf-8 

"To make vsplit put the new buffer on the right of the current buffer:
set splitright

"Similarly, to make split put the new buffer below the current buffer:
set splitbelow

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif



let NERDTreeChDirMode=2


set colorcolumn=80 "enable ruler
set cursorline     "enable current line highlighting


"disable hightlighting when searching
set nohlsearch


"Whenever NERDTree buffer gets closed
"NERDTreeToggle fails with an error
"This function fixes this problem
function! g:WorkaroundNERDTreeToggle()
    try | NERDTreeToggle | catch | silent! NERDTree | endtry
endfunction


"Toggle NerdTree
nnoremap \ :call g:WorkaroundNERDTreeToggle()<CR>
vnoremap \ :call g:WorkaroundNERDTreeToggle()<CR>

"Switch between buffers
nnoremap , :bprev! <CR>
vnoremap , :bprev! <CR>

"Switch between buffers
nnoremap . :bnext! <CR>
vnoremap . :bnext! <CR>

"Map combination of jk in insert mode
"Esc i too far away!
inoremap jk <esc>

"turns on vim-airline at startup
set laststatus=2

"Enable powerline fonts
let g:airline_powerline_fonts = 0
let g:airline_left_sep = ''
let g:airline_right_sep = ''

"Tabline enable
let g:airline#extensions#tabline#enabled = 1 

"Only file names in tabs
let g:airline#extensions#tabline#fnamemod = ':t' 

"Map key to close buffers without
"closing windows
nnoremap <Leader>q :Bdelete<CR>

"Save file quickly
nnoremap <Leader>w :w<CR>

"Elegantly create new buffer in current
"window like a decent modern text editor
nnoremap <Leader>n :enew<CR>
"This allows buffer to become hidden
"when new file is created
set hidden

let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}=LYP`
" Need one more keystroke, but on average, it may be more comfortable.
"nmap s <Plug>(easymotion-s2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)


let g:EasyMotion_re_line_anywhere = '\v' .
            \       '(<.|^$)' . '|' .
            \       '(.>|^$)' . '|' .
            \       '(\l)\zs(\u)' . '|' .
            \       '(_\zs.)' . '|' .
            \       '(#\zs.)' . '|' .
            \       "([]!\"#$%&'()*+,\-./:;<=>?@[\\\]^_`{|}~])"  

let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion

"Do the right thing :)
"noremap  <Up> ""
"noremap! <Up> <Esc>
"noremap  <Down> ""
"noremap! <Down> <Esc>
"noremap  <Left> ""
"noremap! <Left> <Esc>
"noremap  <Right> ""
"noremap! <Right> <Esc>

"Toggle relative numbering with Leader+r
nnoremap <Leader>r :setl rnu!<CR> 


"Make movement between
"windows easier by using 
"tab key to switch windows
map <TAB> <C-w><C-w>
map ` <C-w><C-h>


nnoremap m .


"Move more
vnoremap <C-j> 15j
nnoremap <C-j> 15j
vnoremap <C-k> 15k
nnoremap <C-k> 15k

"256 color support
set t_Co=256

"Disable word wrap.
set nowrap

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>" 

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsSnippetsDir=$VIMHOME."/UltiSnips"


let g:ycm_autoclose_preview_window_after_insertion = 1


"Prevents tmux from breaking background
if &term =~ '256color' || &term =~ 'xterm-color'
    " disable Background Color Erase (BCE)
    set t_ut=
endif

set pastetoggle=<Leader>p

"Enable syntax highlightig for $ sign in php, so that whole variable is		
"highlighter		
let php_var_selector_is_identifier = 1

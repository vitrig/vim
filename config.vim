"Required plugins:
"pathogen -- first and foremost
"auto-pairs
"bufexplorer
"ctrlp.vim
"flattown
"fonts
"nerdtree
"seti.vim
"ultisnips
"vim-airline
"vim-bbye
"vim-easymotion
"vim-less
"vim-skeletons
"vim-snippets
"vim-twig
"vim-mark
"seti.vim

"You should set your console font to
"one of patched powerline fonts

"Map leader to space
"It is more reachable
let mapleader = " "

"Pathogen is used to allow installation
"of custom plugins easily
execute pathogen#infect() 

"Disable compatible mode
set nocompatible

"Load example vimrc
source $VIMRUNTIME/vimrc_example.vim
   
"YOLO mode on
set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile     "no swap filese

"remove menu bar
set guioptions-=m  

"remove toolbar
set guioptions-=T  

"remove right-hand scroll bar
set guioptions-=r

"remove left-hand scroll bar
set guioptions-=L 

"display line numbers
set number 

"disable beeping
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

"enable syntax highlighting
syntax enable 

"set colorscheme
colorscheme flattown

"Font settings
if has('gui_running')
  if has("gui_gtk2")
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
  elseif has("gui_win32")
    set guifont=DejaVu_Sans_Mono_for_Powerline:h10:cEASTEUROPE 
  endif
endif


set tabstop=4

set shiftwidth=4

set expandtab

filetype on

filetype plugin on 

filetype indent on

autocmd Filetype cpp setlocal ts=2 sw=2 expandtab
autocmd Filetype c setlocal ts=2 sw=2 expandtab

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


set colorcolumn=79


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
let g:airline_powerline_fonts = 1

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
nmap s <Plug>(easymotion-s2)

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


"Move more
vnoremap <C-j> 15j
nnoremap <C-j> 15j
vnoremap <C-k> 15k
nnoremap <C-k> 15k

"256 color support
set t_Co=256

"Disable word wrap.
set nowrap

set omnifunc=syntaxcomplete#Complete

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>" 
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsSnippetsDir=$VIMHOME."/UltiSnips"

" Activate vim-skeletons
let skeletons#autoRegister = 1

let skeletons#skeletonsDir = $VIMHOME."/skeletons"


"Prevents tmux from breaking background
if &term =~ '256color'
  " disable Background Color Erase (BCE)
  set t_ut=
endif

"Prevents tmux from breaking background
if &term =~ 'xterm-color'
  " disable Background Color Erase (BCE)
  set t_ut=
endif

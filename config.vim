let mapleader = " " "Map leader to space - it is more reachable

"Pathogen is used to allow instalation of custom plugins easily
execute pathogen#infect() 

"Editor settings
set nocompatible                "Disable compatible mode
set backspace=indent,eol,start
set history=50		            "keep 50 lines of command line history
set ruler                       "show the cursor position all the time
set showcmd		                "display incomplete commands
set incsearch		            "do incremental searching
set nobackup                    "no backup files
set nowritebackup               "only in case you don't want a backup file while editing
set noswapfile                  "no swap files
set noundofile                  "no undo files
set guioptions-=m               "remove menu bar from gui version of vim
set guioptions-=T               "remove toolbar from gui version of vim
set guioptions-=r               "remove right-hand scroll bar from gui version of vim
set guioptions-=L               "remove left-hand scroll bar from gui version of vim
set number                      "display line numbers
syntax enable                   "enable syntax highlighting
set encoding=utf-8              "The encoding displayed.
set fileencoding=utf-8          "The encoding written to file. 
set splitright                  "To make vsplit put the new buffer on the right of the current buffer:
set splitbelow                  "Similarly, to make split put the new buffer below the current buffer:
set nohlsearch                  "disable hightlighting when searching
set pastetoggle=<Leader>p		"map SPACE + P to set paste 
filetype on                     "enable file type detection
filetype plugin on              "enable loading the plugin files for specific file types with:
filetype indent on              "enable loading the plugin files for specific file types with:
set nowrap                      "Disable word wrap.
set hidden                      "This allows buffer to become hidden when new file is created
set cursorline                  "Highlights current line
set colorcolumn=80              "Vertical ruler at 80
set showbreak=↪\                "How to show end of line
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨,space:. "How to show characters in set list mode

"Coding style settings
set tabstop=4
set shiftwidth=4
set expandtab
set cino=is,(s,m1,N-s,g0

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif


"disable beeping
set noerrorbells visualbell t_vb=
if has('autocmd')
    autocmd GUIEnter * set visualbell t_vb=
endif

" Colorscheme settings
colorscheme one "set colorscheme
set background=dark
highlight NonText ctermbg=NONE  "make background consistent
highlight SpecialKey ctermfg=8
highlight CursorLine cterm=NONE "remove underline from CursorLine
highlight ColorColumn term=bold cterm=bold ctermbg=236
highlight CursorLine term=bold cterm=bold ctermbg=236

"completion menu text color fix
highlight Pmenu ctermfg=8
"highlight VertSplit term=NONE cterm=NONE ctermbg=8
set fillchars=vert:\            "remove ugly vertical line characters '|' which are visible on some colorschemes

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


let NERDTreeChDirMode=2


"Whenever NERDTree buffer gets closed
"NERDTreeToggle fails with an error
"This function fixes this problem
function! g:WorkaroundNERDTreeToggle()
    try | NERDTreeToggle | catch | silent! NERDTree | endtry
endfunction


"Toggle NerdTree
nnoremap \ :call g:WorkaroundNERDTreeToggle()<CR>
vnoremap \ :call g:WorkaroundNERDTreeToggle()<CR>
nnoremap <Leader>y :call g:WorkaroundNERDTreeToggle()<CR>
nnoremap <Leader>y :call g:WorkaroundNERDTreeToggle()<CR>

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
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_theme = 'onedark'

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
 
"We don't want vim-gitgutter to set up any mappings at all, because
"the conflict wit easymotion-linebackward
let g:gitgutter_map_keys = 0

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


"Toggle relative numbering with Leader+r
nnoremap <Leader>r :setl rnu!<CR> 

"Make movement between
"windows easier by using 
"tab key and `` to switch windows
map <TAB> <C-w><C-w>
map ` <C-w><C-h>
map <Leader>o <C-w><C-w>
map <Leader>u <C-w><C-h>



nnoremap m .
vnoremap <C-j> 15j
nnoremap <C-j> 15j
vnoremap <C-k> 15k
nnoremap <C-k> 15k

"Executing python code inline
"============================
"Execute selection and replace
nnoremap <Leader>x :'<,'>Pyer<CR>
vnoremap <Leader>x :'<,'>Pyer<CR>
"Execute selection and append
nnoremap <Leader>z :'<,'>Pyea<CR>
vnoremap <Leader>z :'<,'>Pyea<CR>

let g:UltiSnipsExpandTrigger="<c-l>" " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
                                          " Do not set this to c-j it will break visual selection with fast movement
let g:UltiSnipsJumpForwardTrigger="<c-l>" " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
                                          " Do not set this to c-j it will break visual selection with fast movement
let g:UltiSnipsJumpBackwardTrigger="<c-h>" " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsEditSplit="vertical" " If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsSnippetsDir=$VIMHOME."/UltiSnips"


let g:ycm_autoclose_preview_window_after_insertion = 1
"Do not ask whether to load .ycm_extra_conf
let g:ycm_confirm_extra_conf = 0
let g:ycm_complete_in_comments = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_python_binary_path = 'python'

nnoremap <Leader>g :YcmCompleter GoTo<CR>

let g:switch_mapping = "-" "Map :Switch command to -. - is prev line by default (not very useful)

"Enable syntax highlightig for $ sign in php, so that whole variable is		
"highlighter		
let php_var_selector_is_identifier = 1


"tagbar
"======
nnoremap \| :TagbarToggle<CR>
vnoremap \| :TagbarToggle<CR>


"CTRL-P
"======
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_open_multiple_files = 'i'
let g:ctrlp_arg_map = 0

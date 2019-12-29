"Plugins
"=======
"auto-pairs
"bufexplorer
"fonts
"fzf
"fzf.vim
"nerdtree
"php.vim
"rainbow
"switch.vim
"vim-airline
"vim-airline-themes
"vim-bbye
"vim-colors-github
"vim-easymotion
"vim-fugitive
"vim-gitgutter
"vim-less
"vim-mark
"vim-python-pep8-indent
"vim-solarized8
"vim-twig


"Pathogen
"========
"Pathogen is used to allow instalation of custom plugins easily
execute pathogen#infect() 


"Misc
"====
let mapleader = " "             "Map leader to space - it is more reachable
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
set guicursor=                  "prevent NeoVIM from changing the cursor
set number                      "display line numbers
syntax enable                   "enable syntax highlighting
set encoding=utf-8              "The encoding displayed.
set fileencoding=utf-8          "The encoding written to file. 
set splitright                  "To make vsplit put the new buffer on the right of the current buffer:
set splitbelow                  "Similarly, to make split put the new buffer below the current buffer:
set nohlsearch                  "disable hightlighting when searching
filetype on                     "enable file type detection
filetype plugin on              "enable loading the plugin files for specific file types with:
filetype indent on              "enable loading the plugin files for specific file types with:
set nowrap                      "Disable word wrap.
set hidden                      "This allows buffer to become hidden when new file is created
set cursorline                  "Highlights current line
set colorcolumn=80              "Vertical ruler at 80
"set showbreak=↪\                "How to show end of line
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨,space:. "How to show characters in set list mode
set ttyfast                     "Enable more smooth scrolling by sending more characters into terminal
set lazyredraw                  "Buffer screen instead of updating all the time
set signcolumn=yes              "Always show signcolumn - removed flickering effect
autocmd FileType tagbar,nerdtree setlocal signcolumn=no "There are certain filetypes that are not supposed to have the column


"Coding style
"============
set tabstop=4
set shiftwidth=4
set expandtab
set cino=is,(s,m1,N-s,g0


"Terminal and window
"===================
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
" ====================
" Keep in ming that tmux tends to break things
" ❯ cat ~/.tmux.conf
" # Enable RGB colour if running in xterm(1)
" set-option -sa terminal-overrides ",xterm*:Tc"
"
" Remember about airline theme below
" Enable true color
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
set background=light
colorscheme github
"Error Fix error highlight on white backgrounds
"highlight SpellBad ctermfg=0 ctermbg=214 guibg=#ffdddd guifg=#000000
"highlight SpellCap ctermfg=0 ctermbg=214 guibg=#ffdddd guifg=#000000
highlight Error ctermfg=0 ctermbg=214 guibg=#ff5555 guifg=#000000
"make background consistent
highlight NonText ctermbg=NONE
highlight SpecialKey ctermfg=8
highlight CursorLine cterm=NONE "remove underline from CursorLine
highlight ColorColumn term=bold cterm=bold ctermbg=236
highlight CursorLine term=bold cterm=bold ctermbg=236
"completion menu text color fix
highlight Pmenu ctermfg=8
"Remove the ugly border that separates window
highlight VertSplit term=NONE cterm=NONE ctermbg=NONE guibg=NONE
set fillchars=vert:\            "remove ugly vertical line characters '|' which are visible on some colorschemes


"NERDTree
"========
let NERDTreeChDirMode=2
"NERDTree window width in columns
let g:NERDTreeWinSize=25 
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
"Open NerdTree when vim starts
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


"Airline
"=======
"turns on vim-airline at startup
set laststatus=2
"Enable powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_theme = 'github'
"Tabline enable
let g:airline#extensions#tabline#enabled = 1 
"Only file names in tabs
let g:airline#extensions#tabline#fnamemod = ':t' 


"Quicksave
"=========
"Save file quickly
nnoremap <Leader>w :w<CR>


"Buffer management
"=====================
"Elegantly create new buffer in current
"window like a decent modern text editor
nnoremap <Leader>n :enew<CR>
"Map key to close buffers without
"closing windows
nnoremap <Leader>q :Bdelete<CR>
"Switch between buffers
nnoremap , :bprev! <CR>
vnoremap , :bprev! <CR>
"Switch between buffers
nnoremap . :bnext! <CR>
vnoremap . :bnext! <CR>


"EasyMotion
"==========
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


"Window switch
"============
"Make movement between
"windows easier by using 
"tab key and `` to switch windows
map <TAB> <C-w><C-w>
map ` <C-w><C-h>
map <Leader>o <C-w><C-w>
map <Leader>u <C-w><C-h>


"Movement
"========
nnoremap m .
vnoremap <C-j> 15j
nnoremap <C-j> 15j
vnoremap <C-k> 15k
nnoremap <C-k> 15k
"Map combination of jk in insert mode
"Esc is too far away!
inoremap jk <esc>


"Switch
"======
let g:switch_mapping = "-" "Map :Switch command to -. - is prev line by default (not very useful)


"PHP
"===
"Enable syntax highlightig for $ sign in php, so that whole variable is		
"highlighter		
let php_var_selector_is_identifier = 1


"fzf: https://github.com/junegunn/fzf
"====================================
set rtp+=$FZF_HOME
map <c-p> :FZF<CR>


"fzf.vim
"=======
nnoremap <silent> <expr> <c-g> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Ag ".expand("<cword>")."\<cr>"


"Terminal
"========
tnoremap jk <C-\><C-n>


"Colored parentheses
"===================
let g:rainbow_active = 1
let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['39', '161', '135', '76', '11', '7'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
    \   'cpp': {
    \     'parentheses': [
    \       'start=/(/ end=/)/ fold',
    \       'start=/\[/ end=/\]/ fold',
    \       'start=/{/ end=/}/ fold',
    \       'start=/\(\(\<operator\>\)\@<!<\)\&[a-zA-Z0-9_]\@<=<\ze[^<]/ end=/>/'] }
	\}
    \} 


"clang-format
"============
map <C-l> :pyf /usr/share/clang/clang-format.py<cr>

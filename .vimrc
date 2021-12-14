"=======================================================
" FILENAME: .vimrc
" AUTHOR  : Kevin Chen
" DATE    : 2013-09-23
"=======================================================

"-------------------------------------------------------
" misc
"-------------------------------------------------------
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"execute pathogen#infect()
set lines=50 columns=150
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
set nu!
set history=50
set showcmd
set showmode
set showmatch

syntax on
colorscheme morning
"set guifont=Courier\ 10\ Pitch\ 12
set guifont=Monospace\ 10
"set guifontset=-*-*-medium-r-normal--16-*-*-*-c-*-*-*

set nobackup
set noswapfile

set backspace=2
set linebreak
set hidden
"set scrolloff=5

"-------------------------------------------------------
" replace tab with space
"-------------------------------------------------------
set shiftwidth=2
set sts=2
set tabstop=2
set expandtab

"-------------------------------------------------------
" find & replace settings
"-------------------------------------------------------
set hlsearch
set incsearch
set gdefault

"-------------------------------------------------------
" status bar settings
"-------------------------------------------------------
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
set laststatus=2
set ruler

"-------------------------------------------------------
" filetype settings
"-------------------------------------------------------
filetype on
filetype plugin on
filetype indent on

"-------------------------------------------------------
" indent settings
"-------------------------------------------------------
set cindent
set smartindent
set autoindent
set ai!

"-------------------------------------------------------
" when open a file, return to the last modified place.
"-------------------------------------------------------
if has("autocmd")
    autocmd BufRead *.txt set tw=78
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \     exe "normal g'\"" |
    \ endif
endif

"-------------------------------------------------------
" cscope
"-------------------------------------------------------
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","
nmap <leader>w :w!<cr>
nmap <leader>add :cs add ./cscope.out<cr>

if has ("cscope")
	set cst
	set csto=0 	"define the priority of cscope and ctags files used for tag cmd
	set nocsverb "no result displayed when add a cscope database(successful or failed)

	if filereadable("cscope.out")
		cs add cscope.out
	endif
	set csverb "display result if fail to add a cscope database, change it here to enable it when add cscope database in vim file

	" find where does it exist
	nmap <leader>ce :cs find s <C-R>=expand("<cword>")<CR><CR>
	" find where is it defined
	nmap <leader>cd :cs find g <C-R>=expand("<cword>")<CR><CR>
	" find which function calls it
	nmap <leader>cc :cs find c <C-R>=expand("<cword>")<CR><CR>
	" find functions invoked in this function
   nmap <leader>cb :cs find d <C-R>=expand("<cword>")<CR><CR>
	" find the string pointed, even if it's in a commented out line
	nmap <leader>ct :cs find t <C-R>=expand("<cword>")<CR><CR>
	" find in egrep mode
	nmap <leader>cg :cs find e <C-R>=expand("<cword>")<CR><CR>
	" find and open the file
	nmap <leader>cf :cs find f <C-R>=expand("<cfile>")<CR><CR>
	" find files which include this file
   nmap <leader>ci :cs find i <C-R>=expand("<cfile>")<CR>$<CR>

 	nmap <leader>cse :scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <leader>csd :scs find g <C-R>=expand("<cword>")<CR><CR>
 	nmap <leader>csc :scs find c <C-R>=expand("<cword>")<CR><CR>
  	nmap <leader>csb :scs find d <C-R>=expand("<cword>")<CR><CR>
  	nmap <leader>cst :scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <leader>csg :scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <leader>csf :scs find f <C-R>=expand("<cfile>")<CR><CR>
  	nmap <leader>csi :scs find i <C-R>=expand("<cfile>")<CR>$<CR>
  	nmap <leader>cve :vert scs find s <C-R>=expand("<cword>")<CR><CR>
  	nmap <leader>cvd :vert scs find g <C-R>=expand("<cword>")<CR><CR>
  	nmap <leader>cvc :vert scs find c <C-R>=expand("<cword>")<CR><CR>
  	nmap <leader>csb :vert scs find d <C-R>=expand("<cword>")<CR><CR>
  	nmap <leader>cvt :vert scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <leader>cvg :vert scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <leader>cvf :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
  	nmap <leader>cvi :vert scs find i <C-R>=expand("<cfile>")<CR>$<CR>
endif   
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <C-a> ggvG$
nmap <F3> :w<CR>
imap <F3> <Esc>:w<CR>
nnoremap <F4> :NERDTree /slowfs/us01dwt2p840/gatesim/liyuan/<CR>
nnoremap <F5> :NERDTree <CR>
let NERDTreeShowBookmarks = 1 
nnoremap <Leader>a : Tabularize /
vnoremap <Leader>a : Tabularize /

inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-j> <Down>
inoremap <C-k> <Up>

"execute pathogen#infect()
"runtime bundle/vim-pathogen-master/autoload/pathogen.vim
""runtime bundle/tabular-master/autoload/tabular.vim
"runtime bundle/tabular-master/autoload/tabular.vim

 set cmdheight=3

"height ligth cusor
set bg=light
"set cursorline
set cursorcolumn
 
"highlight CursorLine cterm=none ctermbg=236
highlight CursorColumn cterm=none ctermbg=236

let g:indent_guides_enable_on_vim_startup = 1 
let g:indent_guides_start_level = 1           
let g:indent_guides_guide_size = 1            
let g:indent_guides_tab_guides = 0            

" window max
"if has('win32')    
"	au GUIEnter * simalt ~x
"else    
"	au GUIEnter * call MaximizeWindow()
"endif 
"
"function! MaximizeWindow()    
"	silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
"endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'

set gcr=a:blinkon0

set tags+=$REPO_PATH/TAGS
nnoremap <C-]> :ts <C-R><C-W><CR>

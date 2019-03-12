" Settings
set nocompatible
set sh=/bin/bash
set backupdir=~/.vim_backup//
set directory=~/.vim_swp//
set ruler
set number
set expandtab
set laststatus=2
set incsearch
set autoindent
set showcmd
set tabstop=2
set shiftwidth=2
set numberwidth=5
set textwidth=100
set ignorecase
set smartcase
set tags=./tags;
set guioptions-=T
set guioptions-=r
set foldenable
set foldmethod=manual
set mouse=a
set colorcolumn=80
set backspace=indent,eol,start
set nowrap
set cursorline

set completeopt=longest,menu
set wildmode=list:longest,list:full
set complete=.,t


" Set up NeoBundle
set rtp+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch "Shougo/neobundle.vim"

" My bundles
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle "Lokaltog/vim-distinguished"
NeoBundle "scrooloose/nerdtree"
NeoBundle "scrooloose/syntastic"
NeoBundle "tomtom/tlib_vim"
NeoBundle "MarcWeber/vim-addon-mw-utils"
NeoBundle "bling/vim-airline"
NeoBundle "flazz/vim-colorschemes"
NeoBundle "tpope/vim-fugitive"
NeoBundle "tpope/vim-git"
NeoBundle "tpope/vim-surround"
NeoBundle "pangloss/vim-javascript"
NeoBundle "groenewege/vim-less"
NeoBundle "garbas/vim-snipmate"
NeoBundle "honza/vim-snippets"
NeoBundle "Shougo/unite.vim"
NeoBundle "ctrlpvim/ctrlp.vim"
NeoBundle "Shougo/vimshell.vim"
NeoBundle "isRuslan/vim-es6"
NeoBundle "pangloss/vim-javascript"
NeoBundle "jelera/vim-javascript-syntax" 
NeoBundle "jiangmiao/auto-pairs"
NeoBundle "fatih/vim-go"

call neobundle#end()

filetyp plugin indent on

NeoBundleCheck

colorscheme molokai

"syntax highlighting
set background=dark
syntax on
"color mango

if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif


  " Automatically load .vimrc source when saved
autocmd BufWritePost .vimrc source $MYVIMRC


" automatically open quickfix window on grep searches
autocmd QuickFixCmdPost *grep* cwindow

au BufNewFile,BufRead *.markdown,*.md setf markdown

if has("gui_running")
   set guifont=Operator\ Mono:h11
endif

" Functions
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

" Key Bindings
let mapleader = ","

inoremap kj <Esc>
inoremap <C-c> <Esc>
nnoremap <Leader>n :call NumberToggle()<cr>

" Split windows
nnoremap <Leader>s :sp<cr><C-w><C-w>
nnoremap <Leader>v :vsp<cr><C-w><C-w>

" Easily switch between windows
nnoremap <silent> <c-k> :wincmd k<cr>
nnoremap <silent> <c-j> :wincmd j<cr>
nnoremap <silent> <c-h> :wincmd h<cr>
nnoremap <silent> <c-l> :wincmd l<cr>

" Exit insert mode and write file
inoremap <leader>w <Esc> :w<cr>
nnoremap <leader>w :w<cr>

" NERDTree
let NERDTreeShowHidden=1
nnoremap <leader><Tab> :NERDTreeToggle<cr>

" Unite
let g:unite_source_history_yank_enable=1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <Leader>t :Unite -buffer-name=files -start-insert file_rec/async:!<cr>
nnoremap <Leader>f :Unite -buffer-name=files -start-insert file<cr>
nnoremap <Leader>r :Unite -buffer-name=mru -start-insert file_mru<cr>
nnoremap <Leader>g :Unite -buffer-name=register -start-insert register<cr>
nnoremap <Leader>o :Unite -buffer-name=outline -start-insert outline<cr>
nnoremap <Leader>y :Unite -buffer-name=yank history/yank<cr>
nnoremap <Leader>e :Unite -buffer-name=buffer buffer<cr>

" CtrlP
" 'c' The directory of current file
" 'r' nearest ancestor with .git
let g:ctrlp_working_path_mode='r'

" linter settings
 set statusline+=%#warningmsg#
 set statusline+=%{SyntasticStatuslineFlag()}
 set statusline+=%*

 let g:syntastic_always_populate_loc_list = 1
 let g:syntastic_loc_list_height = 5
 let g:syntastic_auto_loc_list = 0
 let g:syntastic_check_on_open = 1
 let g:syntastic_check_on_wq = 1
 let g:syntastic_javascript_checkers = ['eslint']

 let g:syntastic_error_symbol = '❌'
 let g:syntastic_style_error_symbol = '⁉️'
 let g:syntastic_warning_symbol = '⚠️'
 let g:syntastic_style_warning_symbol = '💩'

 highlight link SyntasticErrorSign SignColumn
 highlight link SyntasticWarningSign SignColumn
 highlight link SyntasticStyleErrorSign SignColumn
 highlight link SyntasticStyleWarningSign SignColumn

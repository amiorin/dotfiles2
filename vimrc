" Vundle {{{1
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'altercation/vim-colors-solarized'
Bundle 'jeetsukumaran/vim-buffergator'
Bundle 'majutsushi/tagbar'
Bundle 'ervandew/supertab'
Bundle 'mileszs/ack.vim'
Bundle 'amiorin/vim-eval'
Bundle 'dahu/vim-fanfingtastic'
Bundle 'dahu/LearnVim'
Bundle 'tpope/vim-surround'
Bundle 'ervandew/screen'
Bundle 'guns/paredit'
Bundle 'vim-scripts/Rainbow-Parentheses-Improved-and2'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-endwise'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'
Bundle 'pangloss/vim-javascript'
Bundle 'tpope/vim-haml'
Bundle 'godlygeek/tabular'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-markdown'

filetype plugin indent on     " required!

" paredit {{{1
let g:paredit_smartjump = 1
let g:paredit_leader = '§'

" lisp and others {{{1
au BufNewFile,BufRead *.{wisp,scm,ls,shen} call PareditInitBuffer()
au BufNewFile,BufRead *.{wisp,scm,ls,shen} nmap <silent> <buffer> <space>c v(((((((:ScreenSend<cr>
au BufNewFile,BufRead *.{wisp,scm,ls,shen} vmap <silent> <buffer> <space>c :ScreenSend<cr>
au BufNewFile,BufRead *.{wisp,scm,ls,shen} nmap <buffer> l f)
au BufNewFile,BufRead *.{wisp,scm,ls,shen} nmap <buffer> L F)
au BufNewFile,BufRead *.{wisp,scm,ls,shen} nmap <buffer> H f(
au BufNewFile,BufRead *.{wisp,scm,ls,shen} nmap <buffer> h F(
au BufRead,BufNewFile *.wisp set ft=wisp
au BufRead,BufNewFile *.shen set ft=clj

" xml {{{1
let g:xml_syntax_folding = 1
set foldmethod=syntax 
" diff {{{1
nnoremap <silent> <space>dt :diffthis<CR>
nnoremap <silent> <space>do :diffoff<CR>

" rainbow parentheses {{{1
let g:rainbow_active = 1
let g:rainbow_operators = 1

" List chars {{{1
set list
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen

" fanfingtastic {{{1
let g:fanfingtastic_use_jumplist = 1

" help {{{1
autocmd FileType vim set keywordprg=":help" " use the :help command for 'K' in .vim files
autocmd FileType help nnoremap <buffer> q :q<CR>

" hardcore {{{1
nmap <BS> ge
nmap <S-BS> gE
nnoremap gh <Left>
nnoremap gl <Right>
nnoremap h <Nop>
nnoremap j <C-d>
nnoremap k <C-u>
nnoremap l <Nop>

" ack {{{1
nnoremap <space>a :Ack

" easymotion {{{1
let g:EasyMotion_leader_key = '<Space>'

" powerline {{{1
set guifont=Menlo\ for\ Powerline:h11
let g:Powerline_symbols = 'fancy'

" NERDTree and other sidebars {{{1
nnoremap <silent> sa :vertical resize 40<CR>
let g:NERDTreeMapCWD = "<F2>"
let g:NERDTreeMapHelp = "<F1>"
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeWinSize = 40
nnoremap <silent> ss :NERDTreeToggle<CR>
nnoremap <silent> sd :TagbarToggle<CR>
nnoremap <silent> sf :BuffergatorToggle<CR>

" CtrlP {{{1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cmd = 'CtrlPMRUFiles'
let g:ctrlp_switch_buffer = 0
nmap <D-p> <C-p>

" buffergator {{{1
let g:buffergator_display_regime = "bufname"
let g:buffergator_sort_regime = "filepath"

" no matchparen {{{1
let loaded_matchparen = 1

" solarized {{{1
set background=dark
colorscheme solarized

" Misc {{{1
set wildmode=list:longest
set wildmenu
set wildignore=*.o,*.obj,*~
set visualbell
nmap <space> <nop>
nmap s <nop>
set noto
set history=2000
set laststatus=2
set showcmd
set showmatch
set ignorecase
set smartcase
set incsearch
set nowrap
set hlsearch
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set number
set nobackup
set noswapfile
set backspace=indent,eol,start
set cursorline
set foldlevel=1000
if has("gui_running")
  set guioptions=-t
  set guioptions=e
endif

" no paste with mouse {{{1
nnoremap <MiddleMouse> <Nop>
nnoremap <2-MiddleMouse> <Nop>
nnoremap <3-MiddleMouse> <Nop>
nnoremap <4-MiddleMouse> <Nop>

inoremap <MiddleMouse> <Nop>
inoremap <2-MiddleMouse> <Nop>
inoremap <3-MiddleMouse> <Nop>
inoremap <4-MiddleMouse> <Nop>

nmap <silent> <space><space> :noh<CR>

" windows {{{1
noremap <space>o <C-w>o
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
inoremap <C-h> <Esc><C-w>h
inoremap <C-j> <Esc><C-w>j
inoremap <C-k> <Esc><C-w>k
inoremap <C-l> <Esc><C-w>l
" }}}
" vim: sw=2 ts=2 et fdm=marker fdl=0:

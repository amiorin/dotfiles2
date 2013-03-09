" vim: sw=2 ts=2 et fdm=marker nofoldenable :
" Alberto Miorin's .vimrc File
" "zo" to open folds, "zc" to close, "zi" to toggle
" Vundle {{{1
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'dahu/vim-fanfingtastic'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'jeetsukumaran/vim-buffergator'
Bundle 'majutsushi/tagbar'
Bundle 'Lokaltog/vim-powerline'
Bundle 'altercation/vim-colors-solarized'
Bundle 'ervandew/supertab'
Bundle 'mileszs/ack.vim'
Bundle 'amiorin/vim-eval'
Bundle 'dahu/LearnVim'
Bundle 'guns/paredit'
Bundle 'vim-scripts/Rainbow-Parentheses-Improved-and2'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-speeddating'
Bundle 'pangloss/vim-javascript'
Bundle 'godlygeek/tabular'
Bundle 'sjl/gundo.vim'
Bundle 'jgdavey/tslime.vim'
Bundle 'ervandew/screen'
Bundle 'maxbrunsfeld/vim-yankstack'
Bundle 'tomtom/quickfixsigns_vim'
Bundle 'tyru/open-browser.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'amiorin/ctrlp-z'
Bundle 'tacahiroy/ctrlp-funky'
Bundle 'ctrlp-filetype'
Bundle 'ctrlp-register'
Bundle 'ctrlp-verboselet'
Bundle 'milkypostman/vim-togglelist'
Bundle 'amiorin/tinykeymap_vim'

filetype plugin indent on     " required!
syntax on

" tinykeymap {{{1
let g:tinykeymap#mapleader = '<Space>m'
let g:tinykeymaps_default = []

" togglelist {{{1
g:toggle_list_no_mappings = 0
nmap <silent> <space>l :call ToggleLocationList()<CR>
nmap <silent> <space>q :call ToggleQuickfixList()<CR>

" quifixsigns {{{1
let g:quickfixsigns_classes=['qfl', 'vcsdiff', 'breakpoints']

" paredit {{{1
let g:paredit_smartjump = 1
"let g:paredit_leader = '§'

" yankstack {{{1
let g:yankstack_map_keys = 0
nmap [p <Plug>yankstack_substitute_older_paste
nmap ]p <Plug>yankstack_substitute_newer_paste
call yankstack#setup()
map Y y$

" OSX clipboard {{{1
noremap <space>y "*y
noremap <space>yy "*yy
noremap <space>Y "*y$
"noremap <space>p :set paste<CR>"*p:set nopaste<CR>
"noremap <space>P :set paste<CR>"*P:set nopaste<CR>
" lisp and others {{{1
au BufNewFile,BufRead *.{wisp,scm,ls,shen} call PareditInitBuffer()
au BufNewFile,BufRead *.{wisp,scm,ls,shen} nmap <silent> <buffer> <space>c v(((((((:ScreenSend<cr>
au BufNewFile,BufRead *.{wisp,scm,ls,shen} vmap <silent> <buffer> <space>c :ScreenSend<cr>
"au BufNewFile,BufRead *.{wisp,scm,ls,shen} nmap <buffer> l f)
"au BufNewFile,BufRead *.{wisp,scm,ls,shen} nmap <buffer> L F)
"au BufNewFile,BufRead *.{wisp,scm,ls,shen} nmap <buffer> H f(
"au BufNewFile,BufRead *.{wisp,scm,ls,shen} nmap <buffer> h F(
au BufRead,BufNewFile *.wisp set ft=wisp
au BufRead,BufNewFile *.shen set ft=clj

" viml {{{1
autocmd FileType vim set et

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
let g:fanfingtastic_ignorecase = 1
let g:fanfingtastic_use_jumplist = 1

" help {{{1
autocmd FileType vim set keywordprg=":help"  " use the :help command for 'K' in .vim files
autocmd FileType help set keywordprg=":help" " use the :help command for 'K' in .vim files
autocmd FileType help nnoremap <buffer> q :q<CR>

" easymotion {{{1
let g:EasyMotion_mapping_ge = '<space><BS>'
let g:EasyMotion_mapping_gE = '<space><S-BS>'
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'
"vnoremap  <Space><BS>   :<C-U>call EasyMotion#E(1, 1)<CR>
"nnoremap  <Space><BS>   :call EasyMotion#E(0, 1)<CR>
"vnoremap  <Space><S-BS>   :<C-U>call EasyMotion#EW(1, 1)<CR>
"nnoremap  <Space><S-BS>   :call EasyMotion#EW(0, 1)<CR>
let g:EasyMotion_do_shade = 0
let g:EasyMotion_leader_key = '<Space>'

" hardcore {{{1
nnoremap <BS> ge
nnoremap <S-BS> gE
nnoremap gh <Left>
nnoremap gl <Right>
nnoremap h <Nop>
nnoremap j <Nop>
nnoremap k <Nop>
nnoremap l <Nop>

" ack {{{1
nnoremap <space>a :Ack 

" powerline {{{1
set guifont=Menlo\ for\ Powerline:h18
let g:Powerline_symbols = 'fancy'

" NERDTree and other sidebars {{{1
cnoremap %% <C-R>=expand('%:h').'/'<CR>
map <space>sh :NERDTree %%<CR>
nnoremap <silent> sa :vertical resize 40<CR>
let g:NERDTreeMapCWD = "<F2>"
let g:NERDTreeMapHelp = "<F1>"
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeWinSize = 40
nnoremap <silent> ss :NERDTreeToggle<CR>
nnoremap <silent> sd :TagbarToggle<CR>
nnoremap <silent> sf :BuffergatorToggle<CR>

" CtrlP {{{1
let g:ctrlp_z_nerdtree = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cmd = 'CtrlPMRUFiles'
let g:ctrlp_switch_buffer = 0
nnoremap <silent> <space>pm :CtrlPMRUFiles<CR>
nnoremap <silent> <space>pt :CtrlPFunky<CR>
nnoremap <silent> <space>pz :CtrlPZ<CR>
nnoremap <silent> <space>pf :CtrlP<CR>
nnoremap <silent> <space>pb :CtrlPBuffer<CR>
nnoremap <silent> <space>ph :CtrlPTag<CR>
nnoremap <silent> <space>ph :h<CR>:CtrlPTag<CR>

" buffergator {{{1
let g:buffergator_display_regime = "bufname"
let g:buffergator_sort_regime = "filepath"
let g:buffergator_viewport_split_policy = "T"
let g:buffergator_split_size = 10

" no matchparen {{{1
let loaded_matchparen = 1

" solarized {{{1
colorscheme solarized
if has("gui_running")
  set background=dark
else
  set background=light
endif

" Misc {{{1
"set wildmode=full
"set wildmenu
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
set nosmartcase
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
set autoread
set autowrite
set autowriteall
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
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
inoremap <C-h> <Esc><C-w>h
inoremap <C-j> <Esc><C-w>j
inoremap <C-k> <Esc><C-w>k
inoremap <C-l> <Esc><C-w>l
" accents {{{1
"iabbr e' é
"iabbr e` è
"iabbr a` à
"iabbr o` ò
"iabbr o' ó
"iabbr u` ù
"iabbr i` ì

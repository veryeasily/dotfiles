set nocompatible               " be iMproved
filetype off                   " required!


set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
let g:EasyMotion_leader_key = '<Space>'
execute pathogen#infect()

 " let Vundle manage Vundle
 " required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
" Bundle 'tpope/vim-fugitive'
" Bundle 'EasyMotion'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Bundle 'tpope/vim-rails.git'
" vim-scripts repos
" Bundle 'php.vim'
" Bundle 'jade.vim'
" Bundle 'L9'
" Bundle 'FuzzyFinder'
" Bundle 'html5.vim'
" Bundle 'Markdown-syntax'
" Bundle 'Vimball'
" Bundle 'node.js'
" Bundle 'jshint.vim'
" Bundle 'vim-coffee-script'
" Bundle 'go.vim'
" non github repos
" Bundle 'git://git.wincent.com/command-t.git'
" Bundle 'Tagbar'
" Bundle 'surround.vim'
" Bundle 'tern_for_vim-master'
" ...

filetype on
filetype plugin on
filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

set expandtab
set ts=4
set sw=4

vnoremap _( <Esc>`>a)<Esc>`<i(<Esc>

" set tab completion in command mode
set wildmode=longest,list,full
set wildmenu

" here is insert mode tab completion.
" inoremap <tab> <c-x><c-o>
" inoremap <s-tab> <tab>


" set's a reasonable timeout
set timeout ttimeoutlen=50

" Window navigation commands
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h

" here is tab creation stuff.
nnoremap <F2> :tabprevious<cr>
nnoremap <F3> :tabnext<cr>
let mapleader = "_"

" here is tab navigation stuff
noremap <F2> <esc>:tabprevious<cr>
noremap <F3> <esc>:tabnext<cr>

" NERDTree stuff
noremap gT :NERDTree<CR>

" This next setting let's us use vim's man setting
" even when vim is the man-page default for ZSH
let $PAGER=''

" other stuff
vnoremap <c-c> "+y

set bs=indent,eol,start
filetype off
filetype on
syntax enable
set ruler
set autoindent
set nocindent

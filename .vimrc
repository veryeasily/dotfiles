set nocompatible               " be iMproved
filetype off                   " required!

" Window navigation commands
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h


set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

 " let Vundle manage Vundle
 " required! 
 Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
let g:EasyMotion_leader_key = '<Space>'
Bundle 'EasyMotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'php.vim'
Bundle 'jade.vim'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'html5.vim'
Bundle 'Markdown-syntax'
Bundle 'Vimball'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
Bundle 'SuperTab'
" ...

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

" here is tab creation stuff.
nnoremap <C-t> :tabnew<cr>
nnoremap <F2> :tabnext<cr>
nnoremap <F3> :tabprevious<cr>
map <C-w> :tabclose<cr>
inoremap <F2> <esc>:tabnext<cr>
inoremap <F3> <esc>:tabprevious<cr>
inoremap <C-t> <ESC>:tabnew<cr>
set pastetoggle=_P
vnoremap <c-v> "+y
" tessssssssst

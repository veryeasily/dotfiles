set nocompatible               " be iMproved
filetype off                   " required!

" Window navigation commands
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h

let g:ag_working_path_mode="r"
let g:CommandTFileScanner = 'git'
let g:EasyClipShareYanks = 1
let g:EasyMotion_leader_key = '<Space>'
let g:jsx_ext_required = 0
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:tern_map_keys=1
let g:tern_map_prefix='<space>'
let g:tern_request_timeout = 2
let g:tern_show_argument_hints="on_hold"
let g:ycm_complete_in_comments = 1

let mapleader = ","
let maplocalleader = '\'

let g:ctrlp_map = '<leader>t'

" ctlrp root path uses git
let g:ctrlp_working_path_mode = 'ra'

" ignore big folders
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|__pycache__|data|node_modules)$',
  \ 'file': '\v\.(exe|so|dll|pyc)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }


" https://robots.thoughtbot.com/faster-grepping-in-vim
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap gk :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

execute pathogen#infect()

nnoremap <Leader>ag :set nohlsearch<CR>

filetype on
filetype plugin on
filetype plugin indent on     " required!

vnoremap _( <Esc>`>a)<Esc>`<i(<Esc>

" set tab completion in command mode
set wildmode=longest,list,full
set wildmenu

" here is insert mode tab completion.
" inoremap <tab> <c-x><c-o>
" inoremap <s-tab> <tab>


" set's a reasonable timeout
set timeout ttimeoutlen=50
set ts=2
set sw=2
set sts=2
set expandtab

" here is tab creation stuff.
nnoremap <C-t> :tabnew<cr>
nnoremap <F2> :tabprevious<cr>
nnoremap <F3> :tabnext<cr>
map <C-w> :tabclose<cr>
inoremap <F2> <esc>:tabprevious<cr>
inoremap <F3> <esc>:tabnext<cr>
inoremap <C-t> <ESC>:tabnew<cr>

ino jk <esc>
cno jk <c-c>
vno v <esc>

set pastetoggle=gT
vnoremap <c-v> "+y
noremap <c-n> <c-w>v
set bs=indent,eol,start
set tags=tags;
set autochdir
set omnifunc=syntaxcomplete#Complete

set nohlsearch

" NERDTree
autocmd VimEnter * if argc() != 0 || exists("s:std_in") | wincmd p | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

hi Search cterm=NONE ctermfg=white ctermbg=black

" Ruby
au FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
au FileType ruby,eruby let g:rubycomplete_rails = 1
au FileType ruby,eruby let g:rubycomplete_load_gemfile = 1
au FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby set ballooneval
" au FileType ruby,eruby setl tw=79 comments=:#\  isfname+=:
au FileType ruby,eruby nn <buffer> <F5> :!clear<CR>:!ruby %<CR>
au FileType ruby,eruby nn <buffer> <F9> :!clear<CR>:!rspec %<CR>

filetype off
filetype on
syntax enable

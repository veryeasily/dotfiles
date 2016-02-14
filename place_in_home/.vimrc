set nocompatible               " be iMproved
filetype off                   " required!

" Window navigation commands
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h

let g:EasyMotion_leader_key = '<Space>'
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
execute pathogen#infect()

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
imap jj <Esc>
set pastetoggle=gT
vnoremap <c-v> "+y
noremap <c-n> <c-w>v
set bs=indent,eol,start
set tags=tags;
set autochdir
set omnifunc=syntaxcomplete#Complete
let g:tern_map_keys=1
let g:tern_show_argument_hints="on_hold"
let g:tern_map_prefix='<space>'

" Ruby
au FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
au FileType ruby,eruby let g:rubycomplete_rails = 1
au FileType ruby,eruby let g:rubycomplete_load_gemfile = 1
au FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
au FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby set ballooneval
" au FileType ruby,eruby setl tw=79 comments=:#\  isfname+=:
au FileType ruby,eruby nn <buffer> <F5> :!clear<CR>:!ruby %<CR>
au FileType ruby,eruby nn <buffer> <F9> :!clear<CR>:!rspec %<CR>

filetype off
filetype on
syntax enable


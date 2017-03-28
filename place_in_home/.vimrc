set nocompatible               " be iMproved

" Map leader keys
let mapleader = ","
let maplocalleader = ','

let g:python_host_prog  = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

let g:CommandTFileScanner = 'git'

let g:EasyClipShareYanks = 1
let g:EasyMotion_leader_key = '<Space>'

let g:user_emmet_mode='inv'
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key='<C-p>'

autocmd FileType html,css,javascript.jsx,typescript.tsx EmmetInstall
autocmd FileType html,css,eruby EmmetInstall

let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

let g:ag_working_path_mode="r"

let g:tern_map_keys=1
let g:tern_map_prefix='<space>'
let g:tern_request_timeout = 2
let g:tern_show_argument_hints="on_hold"

let g:ycm_complete_in_comments = 1

let g:ctrlp_map = '<leader>t'

" ctlrp root path uses git
let g:ctrlp_working_path_mode = 'ra'

" overcome limit imposed by max height"
let g:ctrlp_match_window = 'results:20'

" ignore big folders
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|__pycache__|data|node_modules)$',
  \ 'file': '\v\.(exe|so|dll|pyc)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0

" always have a status line, even on 1 window
set laststatus=2

" Syntastic options
set statusline=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=\ \ \ \ \ \ \ \ \ \ %{getcwd()} "this is my hack for whitespace
set statusline+=%=      "left/right separator
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

" set statusline+=%F
" set statusline+=%-{getcwd()}
" 
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" set statusline+=%14.(%l,%c%V%)\ %P

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_ruby_checkers = ['rubocop']

fun! SetScssConfig()
    let scssConfig = findfile('.scss-lint.yml', '.;')
    if scssConfig != ''
        let b:syntastic_scss_scss_lint_args = '--config ' . scssConfig
    endif
endf

execute pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on

" bind gk to grep word under cursor
nnoremap gk :Ag! "\b<C-R><C-W>\b"<CR><CR>
nnoremap gm m
map <leader>a :Ag

" Leave insert and visual mode more easily
ino jk <esc>
cno jk <c-c>
vno v <esc>

" Window navigation commands
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h

" https://robots.thoughtbot.com/faster-grepping-in-vim
" The Silver Searcher
" Use ag over grep
set grepprg=ag\ --nogroup\ --nocolor\ --column
set grepformat=%f:%l:%c%m

if &diff
  colorscheme crayon
else
  colorscheme lucid
endif

set autochdir
set bs=indent,eol,start

" Sets the ability for comments at the beginning of files to set vim
" properties.
set modeline
set nohlsearch
set omnifunc=syntaxcomplete#Complete
set ruler
set sessionoptions-=options
set smarttab
set tags=./tags;/
set tw=79

" set tab completion in command mode
set wildmode=longest,list,full
set wildmenu

" set's a reasonable timeout
set timeout ttimeoutlen=50

" NERDTree
autocmd VimEnter * if argc() != 0 || exists("s:std_in") | wincmd p | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd FileType      scss           :call SetScssConfig()

hi Search cterm=NONE ctermfg=white ctermbg=black

" Enable autowrapping while editing files
au BufNewFile,BufRead * setlocal formatoptions=crqn

" Ruby
au FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
au FileType ruby,eruby let g:rubycomplete_rails = 0
au FileType ruby,eruby let g:rubycomplete_load_gemfile = 1
au FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
au FileType ruby,eruby setl tw=79 comments=:#\  isfname+=:

" au BufNewFile,BufRead * setlocal formatoptions-=lo
au FileType ruby,eruby nn <buffer> <F5> :!clear<CR>:!ruby %<CR>
au FileType ruby,eruby nn <buffer> <F9> :!clear<CR>:!rspec %<CR>

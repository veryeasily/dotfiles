set nocompatible hidden " be iMproved

""" PLUGIN RELATED STUFF

function! Multiple_cursors_before()
  let b:deoplete_disable_auto_complete = 1
endfunction

function! Multiple_cursors_after()
    let b:deoplete_disable_auto_complete = 0
endfunction

source ~/.vimrc.plug

""" END PLUGIN RELATED STUFF


" Map leader keys
let mapleader = ","
let maplocalleader = ','

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
set statusline+=Curent:\ %l\ Total:\ %4L
set statusline+=\ \ \ \ \ \ \ \ \ \ %{getcwd()} "this is my hack for whitespace
set statusline+=%=      "left/right separator
set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

set showcmd " Display our current \[count\]
set incsearch

filetype plugin indent on
syntax on

" round << and >> to the nearest shiftwidth
set shiftround

" bind gk to grep word under cursor
nnoremap gk :Ag! "\b<C-R><C-W>\b"<CR><CR>
nnoremap gm m

" Leave insert and visual mode more easily
inoremap kj <Esc>`^
inoremap jk <Esc>`^
inoremap <C-Q> <Esc>`^
noremap <C-Q> <Esc>
vnoremap <C-Q> <Esc>
cnoremap <C-Q> <Esc>

function! MaybeDown()
  if 
endfunction

" Window navigation commands
noremap <c-j> <c-w>j
inoremap <expr> <c-j> pumvisible() ? "<c-n>" : "<esc>"
noremap <c-k> <c-w>k
inoremap <expr> <c-k> pumvisible() ? "<c-p>" : "<c-w>k"
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h

" Toggle paste mode
noremap <leader>vv <esc>:set paste<CR>i
noremap <leader>nn <esc>:set nopaste<CR>

" Search command history
nnoremap Q <Esc>q:<C-U>?

if has('win32')
  nmap <C-/> <esc>q/?
  vmap <C-/> <esc>q/?
else
  nmap <C-_> <esc>q/?
  vmap <C-_> <esc>q/?
endif

" Scroll through searches. See here:
" https://superuser.com/questions/345215/vim-how-do-you-efficiently-search-for-text#comment379095_345216
" nnoremap <C-S-F> q/

" https://robots.thoughtbot.com/faster-grepping-in-vim
" The Silver Searcher
" Use ag over grep
set grepprg=ag\ --nogroup\ --nocolor\ --column
set grepformat=%f:%l:%c%m

if &diff
  colorscheme jellyx
else
  colorscheme tender
endif

set autochdir
set bs=indent,eol,start

" Sets the ability for comments at the beginning of files to set vim
" properties.
set modeline
set hlsearch
set ruler
set sessionoptions-=options
set smarttab
set tags=./tags;/
set tw=79

set sw=2
set ts=2
set sts=2
set expandtab
set smarttab

" set tab completion in command mode
set wildmode=longest,list,full
set wildmenu

" set's a reasonable timeout
set timeout timeoutlen=300

" set swapfiles to be in the .vim directory
set directory=$HOME/.vim/swapfiles//

nnoremap gz <C-W>\|<C-W>_
nnoremap g= <C-W>=

hi Search cterm=NONE ctermfg=white ctermbg=black

" Enable autowrapping while editing files
au BufNewFile,BufRead * setlocal formatoptions=crqn

" Ruby
au FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
au FileType ruby,eruby let g:rubycomplete_rails = 1
au FileType ruby,eruby let g:rubycomplete_load_gemfile = 1
au FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
au FileType ruby,eruby setl tw=79 comments=:#\  isfname+=:

" au BufNewFile,BufRead * setlocal formatoptions-=lo
" au FileType ruby,eruby nn <buffer> <F5> :!clear<CR>:!ruby %<CR>
" au FileType ruby,eruby nn <buffer> <F9> :!clear<CR>:!rspec %<CR>

if !exists("*MakeScratch")
  function MakeScratch()
    setlocal bufhidden=hide
    setlocal buftype=nofile
    setlocal noswapfile
  endfunction
endif

if !exists("*SaveMapList")
  function SaveMapList()
    redir @" | silent verbose map | redir END | botright new | put!
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  endfunction
endif

if !exists("*SaveLetList")
  function SaveLetList()
    redir @" | silent verbose let | redir END | botright new | put!
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  endfunction
endif

if !exists(":Mapsbuffer")
  command Mapsbuffer :call SaveMapList()
endif

if !exists(":Letsbuffer")
  command Letsbuffer :call SaveLetList()
endif

function! MacroInput(txt)
  call inputsave()
  let text = input('macro prompt: ' . a:txt . '> ')
  call inputrestore()
  return text
endfunction

source ~/.vim.fzf-vim-functions.vim
" source ~/.vimrc.highlights.vim

set history=10000

set gdefault

"""""""""""""""""""""""""
" END original ~/.vimrc "
""""""""""""""""""""""""

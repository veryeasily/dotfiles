" vi: ft=vim
set encoding=utf-8
set nocompatible

filetype plugin indent on
syntax on

" Map leader keys
let mapleader = ','
let maplocalleader = ','

source ~/.vimrc.functions
source ~/.vimrc.plug

" Toggle paste mode
set pastetoggle=<F2>

" always have a status line, even on 1 window
set laststatus=2

" See https://stackoverflow.com/a/16114535
if has('nofixedendofline')
  set nofixendofline
endif

set showcmd " Display our current \[count\]
set incsearch

if filereadable($HOME.'/.vimrc.maps')
   source ~/.vimrc.maps
end

set shiftround

" See: https://github.com/BurntSushi/ripgrep/issues/425#issuecomment-381446152
set grepprg=set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
set grepformat=%f:%l:%c:%m,%f:%l:%m

set bs=indent,eol,start

set modeline
set hlsearch
set ruler
set sessionoptions-=options
set smarttab
set tags=./tags;/
set tw=79

set sw=4
set ts=4
set sts=4
set expandtab
set smarttab

" set tab completion in command mode
set wildmode=longest,list,full
set wildmenu

" set's a reasonable timeout
set timeout ttimeoutlen=100 timeoutlen=500

" Centralize backups, swapfiles and undo history
set backupdir=$HOME/.vim/backups
set directory=$HOME/.vim/swaps
if exists("&undodir")
  set undofile
  set undodir=$HOME/.vim/undo

  " Save it in the nvim dir if we've got that
  if has('nvim')
    set undodir=~/.config/nvim/undodir
  endif
endif

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

set nocompatible

set history=10000

" see https://parceljs.org/hmr.html
set backupcopy=yes

set nu

set hidden

"profile pause
set exrc

set norelativenumber
set updatetime=200

set ignorecase
set smartcase

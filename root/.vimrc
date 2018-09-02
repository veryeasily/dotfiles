" vi: ft=vim
set encoding=utf-8
set nocompatible
filetype plugin indent on
syntax on
 
" Map leader keys
let mapleader = " "
let maplocalleader = " "

" profile file {/home/mors/.vimrc.main,/home/mors/.vimrc.plug}
source ~/.vimrc.plug
""" END PLUGIN RELATED STUFF

" Toggle paste mode
set pastetoggle=<F2>

" always have a status line, even on 1 window
set laststatus=2

" See https://stackoverflow.com/a/16114535
set nofixendofline

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

if filereadable($HOME.'/.vimrc.maps')
   source ~/.vimrc.maps
end

" round << and >> to the nearest shiftwidth
set shiftround

" See: https://github.com/BurntSushi/ripgrep/issues/425#issuecomment-381446152
set grepprg=set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
set grepformat=%f:%l:%c:%m,%f:%l:%m

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
source ~/.vimrc.fzf
" source ~/.vimrc.highlights.vim

set history=10000

" see https://parceljs.org/hmr.html
set backupcopy=yes

set gdefault

set nu

"""""""""""""""""""""""""
" END original ~/.vimrc "
""""""""""""""""""""""""

if has('termguicolors')
  set termguicolors

  """
  " COLORS
  " set Vim-specific sequences for RGB colors
  " Borrowed from https://github.com/vim/vim/issues/993

  silent! let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  silent! let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

if &diff
  silent! colorscheme jellyx
else
  silent! colorscheme gruvbox
endif

set background=dark

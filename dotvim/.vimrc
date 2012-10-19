" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

set nocompatible

set t_Co=256

nnoremap ; :

call pathogen#infect()

nnoremap <F8> :TagbarToggle<CR>

syntax on

filetype plugin indent on

set autoread
set background=dark
highlight CursorLine cterm=bold ctermbg=DarkGrey

set laststatus=2

" set statusline=%t
" set statusline+=%(\ [%M%R%Y]%)
" set statusline+=%=      "left/right separator
" set statusline+=%c,     "cursor column
" set statusline+=%l/%L   "cursor line/total lines
" set statusline+=\ %P    "percent through file

set wildmenu
set wildmode=full
set colorcolumn=+1
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set hlsearch
set incsearch		" Incremental search
set gdefault
set autowrite
set hidden              " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
set ruler
set showmode
set relativenumber
set smarttab

set tabstop=8
set shiftwidth=4
set softtabstop=4
set expandtab

" set iskeyword-=_

set linebreak
set textwidth=79
set autoindent
set smartindent
set wrap
set cursorline
set magic
set scrolloff=99

set list
set listchars=tab:>⋅,trail:⋅,eol:¬,nbsp:⋅

nnoremap j gj
nnoremap k gk

inoremap <UP> <nop>
inoremap <DOWN> <nop>
inoremap <LEFT> <nop>
inoremap <RIGHT> <nop>
nnoremap <UP> <nop>
nnoremap <DOWN> <nop>
nnoremap <LEFT> <nop>
nnoremap <RIGHT> <nop>

highlight ExtraWhitespace ctermbg=red guibg=red

match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * redraw!

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-k> :call NumberToggle()<cr>

autocmd vimenter * if !argc() | NERDTree | endif

let g:syntastic_c_check_header=1
let g:syntastic_cpp_check_header=1
let g:syntastic_check_on_open=1
let g:syntastic_enable_sign=1

let g:Powerline_symbols = 'fancy'

set shell=/bin/bash

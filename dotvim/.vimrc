" Source a global configuration file if available
if filereadable("/etc/vimrc")
  source /etc/vimrc
endif

set nocompatible
set modeline

set t_Co=256

nnoremap ; :

call pathogen#infect()

nnoremap <F8> :TagbarToggle<CR>

syntax on

filetype plugin indent on

set autoread
set background=dark
highlight CursorLine cterm=bold ctermbg=None

highlight Folded cterm=None ctermfg=White ctermbg=None

highlight Pmenu cterm=None ctermfg=White ctermbg=Magenta

" highlight DiffAdd cterm=Bold ctermfg=Blue ctermbg=Black
" highlight DiffChange cterm=Bold ctermfg=Magenta ctermbg=Black
" highlight DiffDelete cterm=Bold ctermfg=Cyan ctermbg=Black
" highlight DiffText cterm=Bold ctermfg=Red ctermbg=Black

set laststatus=2

" set statusline=%t
" set statusline+=%(\ [%M%R%Y]%)
" set statusline+=%=      "left/right separator
" set statusline+=%c,     "cursor column
" set statusline+=%l/%L   "cursor line/total lines
" set statusline+=\ %P    "percent through file

set wildmenu
set wildmode=full
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
set timeoutlen=0
set autochdir

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
set scrolloff=10

nnoremap <silent> j gj
nnoremap <silent> k gk

inoremap <UP> <nop>
inoremap <DOWN> <nop>
inoremap <LEFT> <nop>
inoremap <RIGHT> <nop>
nnoremap <UP> <nop>
nnoremap <DOWN> <nop>
nnoremap <LEFT> <nop>
nnoremap <RIGHT> <nop>

cnoremap help vert help

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

function! SuperCleverTab()
    if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
        return "\<Tab>"
    else
        if &omnifunc != ''
            return "\<C-X>\<C-O>"
        elseif &dictionary != ''
            return "\<C-K>"
        else
            return "\<C-N>"
        endif
    endif
endfunction

inoremap <Tab> <C-R>=SuperCleverTab()<cr>

autocmd vimenter * if !argc() | NERDTree | endif

let g:syntastic_auto_loc_list=1
let g:syntastic_c_compiler_options = ' -W -Wall -Werrors -Wextra -std=c99 -pedantic'
let g:syntastic_c_no_include_search = 1
let g:syntastic_c_check_header=1
let g:syntastic_c_compiler_options = ' -W -Wall -Werrors -Wextra -std=c++0x -pedantic'
let g:syntastic_cpp_check_header=1
let g:syntastic_check_on_open=1
let g:syntastic_enable_sign=1

let g:Powerline_symbols = 'fancy'
call Pl#Theme#InsertSegment('ws_marker', 'after', 'lineinfo')

"let OmniCpp_ShowPrototypeInAbbr = 1

set shell=/bin/bash

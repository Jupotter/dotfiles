" Source a global configuration file if available
if filereadable("/etc/vimrc")
  source /etc/vimrc
endif

"  1 important ----------------------------------------------------------------

set nocompatible " behave very Vi compatible (not advisable)
call pathogen#infect()
" set t_Co=256
let mapleader = ","

"  2 moving around, searching and patterns ------------------------------------

set noautochdir " change to directory of file in buffer
set magic " change the way backslashes are used in search patterns
set ignorecase " ignore case when using a search pattern
set smartcase " override 'ignorecase' when pattern has upper case characters
set hlsearch " highlight all matches for the last used search pattern
set incsearch " show match for partly typed search command

set display+=lastline


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

"  3 tags ---------------------------------------------------------------------

set tags+=~/.vim/tags/stdlibcpp " list of file names to search for tags

source ~/.vim/autotags.vim

"  4 displaying text ----------------------------------------------------------

set wrap " long lines wrap
set linebreak " wrap long lines at a character in 'breakat'
set scrolloff=10 " long lines wrap
set relativenumber " show the relative line number for each line
set number " show the current line number too

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-k> :call NumberToggle()<cr>

" autocmd FocusLost * set number
" autocmd FocusGained * set relativenumber
" autocmd InsertLeave * set relativenumber
" autocmd InsertEnter * set number

"  5 syntax, highlighting and spelling ----------------------------------------

set background=dark " "dark" or "light"; the background color brightness
set cursorline " highlight the screen line of the cursor

syntax on
filetype plugin indent on

highlight CursorLine cterm=bold ctermbg=None
highlight Folded cterm=None ctermfg=White ctermbg=none
highlight FoldColumn cterm=none ctermfg=Grey ctermbg=None
highlight Pmenu cterm=None ctermfg=White ctermbg=Magenta

highlight ExtraWhitespace ctermbg=red guibg=red

match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * redraw!

"  6 multiple windows ---------------------------------------------------------

set laststatus=2 " 0, 1 or 2; when to use a status line for the last window ---

nnoremap <SPACE> <C-w>

if $TERM == "screen-256color"
    let g:Powerline_symbols = 'fancy'
else
    let g:Powerline_symbols = 'unicode'
endif

let g:airline_powerline_fonts = 1
let g:airline#extensions#bufferline#enabled = 1

let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#whitespace#enabled = 1

" call Pl#Theme#InsertSegment('ws_marker', 'after', 'lineinfo')

" set statusline=%t
" set statusline+=%(\ [%M%R%Y]%)
" set statusline+=%=      "left/right separator
" set statusline+=%c,     "cursor column
" set statusline+=%l/%L   "cursor line/total lines
" set statusline+=\ %P    "percent through file

"  7 multiple tab pages -------------------------------------------------------
"  8 terminal -----------------------------------------------------------------
"  9 using the mouse ----------------------------------------------------------

set mouse=nv             " Enable mouse usage (Not Insert because of touchpad)

" 10 printing -----------------------------------------------------------------
" 11 messages and info --------------------------------------------------------

set showcmd " show (partial) command keys in the status line
set showmode " display the current mode in the status line
set ruler " show cursor position below each window

" 12 selecting text -----------------------------------------------------------
" 13 editing text -------------------------------------------------------------

set textwidth=79 " line length above which to break a line
set showmatch " when inserting a bracket, briefly jump to its match

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

" inoremap <Tab> <C-R>=SuperCleverTab()<cr>

" 14 tabs and indenting -------------------------------------------------------

set tabstop=8 " number of spaces a <Tab> in the text stands for
set shiftwidth=4 " number of spaces used for each step of (auto)indent
set smarttab " a <Tab> in an indent inserts 'shiftwidth' spaces
set softtabstop=4 " if non-zero, number of spaces to insert for a <Tab>
set shiftround " round to 'shiftwidth' for "<<" and ">>"
set expandtab " expand <Tab> to spaces in Insert mode
set autoindent " automatically set the indent of a new line
set smartindent " do clever autoindenting

" 15 folding ------------------------------------------------------------------

set foldlevelstart=99 " value for 'foldlevel' when starting to edit a file

" 16 diff mode ----------------------------------------------------------------

" highlight DiffAdd cterm=Bold ctermfg=Blue ctermbg=Black
" highlight DiffChange cterm=Bold ctermfg=Magenta ctermbg=Black
" highlight DiffDelete cterm=Bold ctermfg=Cyan ctermbg=Black
" highlight DiffText cterm=Bold ctermfg=Red ctermbg=Black

" 17 mapping ------------------------------------------------------------------

set timeoutlen=0 " time in msec for 'timeout'

" 18 reading and writing files ------------------------------------------------

set modeline " enable using settings from modelines when reading a file
set autowrite " automatically write a file when leaving a modified buffer
set autoread " automatically read a file when it was modified outside of Vim

" 19 the swap file ------------------------------------------------------------

let s:dir = has('win32') ? '~/Application Data/Vim' : match(system('uname'), "Darwin") > -1 ? '~/Library/Vim' : '~/.local/share/vim'
if isdirectory(expand(s:dir))
    if &directory =~# '^\.,'
        let &directory = expand(s:dir) . '/swap//,' . &directory
    endif
    if &backupdir =~# '^\.,'
        let &backupdir = expand(s:dir) . '/backup//,' . &backupdir
    endif
    if exists('+undodir') && &undodir =~# '^\.\%(,\|$\)'
        let &undodir = expand(s:dir) . '/undo//,' . &undodir
    endif
endif
if exists('+undofile')
    set undofile
endif

" 20 command line editing -----------------------------------------------------

set wildmode=full " specifies how command line completion works
set wildmenu " command-line completion shows a list of matches

" 21 executing external commands ----------------------------------------------

set shell=/bin/bash " name of the shell program used for external commands

" 22 running make and jumping to errors ---------------------------------------
" 23 language specific --------------------------------------------------------
" 24 multi-byte characters ----------------------------------------------------
" 25 various ------------------------------------------------------------------
set gdefault " use the 'g' flag for ":substitute"
set hidden              " Hide buffers when they are abandoned

let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_auto_loc_list=1
"let g:syntastic_c_compiler_options = ' -W -Wall -Werror -Wextra -std=c99 -pedantic'
"let g:syntastic_c_no_include_search = 1
let g:syntastic_c_check_header=1
let g:syntastic_cpp_check_header=1
"let g:syntastic_cpp_compiler_options = ' -W -Wall -Werror -Wextra -std=c++0x -pedantic'
let g:syntastic_check_on_open=1
let g:syntastic_enable_sign=1

let g:bufferline_active_buffer_left = '('
let g:bufferline_active_buffer_right = ')'


highlight SignColumn ctermbg=none

command SudoSave execute "w !sudo tee > /dev/null %"

noremap <C-u> :UndotreeToggle<cr>

"let OmniCpp_ShowPrototypeInAbbr = 1

set shell=/bin/bash

source ~/.vim/autotags.vim
nnoremap ; :
nnoremap <F8> :TagbarToggle<CR>

" vim:ts=8:sts=4:sw=4:et

set colorcolumn=+1
set comments=sl:/*,m:**,elx:*/

set list
set listchars=tab:>⋅,trail:⋅,eol:¬,nbsp:⋅
set foldlevelstart=99
set foldmethod=syntax
set foldnestmax=1

set cindent

if(exists("*SplitHeader") == 0)
    function SplitHeader()
        vertical botright split %:r.h
    endfunc
endif

nnoremap <C-h> :call SplitHeader()<cr>

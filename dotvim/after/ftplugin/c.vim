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
        if(match(expand("%"), "\\.h") == -1)
            vertical botright split %:r.h
        else
            vertical botright split %:r.c
        endif
    endfunc
endif

nnoremap <C-h> :call SplitHeader()<cr>

if(exists("*Headers") == 0)
    function Headers()
        let l = line(".")
        let c = col(".")
        let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
        execute "normal! ggO#ifndef " . gatename
        execute "normal! o# define " . gatename
        execute "normal! o"
        execute "normal! Go#endif /* !" . gatename . " */"
        execute "normal! O"
        call cursor(l, c)
    endfunction
endif

nnoremap <C-F12> :call Headers()<cr>


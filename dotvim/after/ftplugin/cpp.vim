set foldnestmax=2
set foldlevelstart=1

if(exists("*SplitHeaderPP") == 0)
    function SplitHeaderPP()
        if(match(expand("%"), "\\.hh") == -1)
            vertical botright split %:r.hh
        else
            vertical botright split %:r.cc
        endif
    endfunc
endif

nnoremap <C-h> :call SplitHeaderPP()<cr>

if(exists("*CreateClass") == 0)
    function CreateClass()
        let className = substitute(expand("%:t:r"), "\[_-]\\(.\\)", "\\u\\1", "g")
        let className = substitute(className, "^.*", "\\u&", "g")
        if(exists("*Headers") != 0)
            call Headers()
        endif
        call cursor(4, 0)
        execute "normal! iclass " . className
        execute "normal! o{"
        execute "normal! o};"
        execute "normal! ko"
    endfunc
endif

command! -b CreateClass call CreateClass()

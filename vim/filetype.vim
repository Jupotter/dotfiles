au BufRead,BufNewFile *.hh if &ft == 'cpp' | set filetype=cpp-head | endif
au BufRead,BufNewFile *.i set filetype=swig
au BufRead,BufNewFile *.swg set filetype=swig

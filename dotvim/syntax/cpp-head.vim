if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Read the CPP syntax to start with
if version < 600
  so <sfile>:p:h/cpp.vim
else
  runtime! syntax/cpp.vim
  unlet b:current_syntax
endif


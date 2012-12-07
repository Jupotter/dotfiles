" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

runtime! ftplugin/cpp.vim ftplugin/cpp_*.vim ftplugin/cpp/*.vim

" File: ~/.vim/after/ftplugin/csharp.vim
"{{{1

" Mappings to comment and uncomment
nnore <buffer> <localleader>c mqI//<ESC>`q
nnore <buffer> <localleader>nc mq^xx`q

" Mappings for documentation comments
nnore <buffer> <localleader>dc o/**<CR><BS>*<ESC>jkka<SPACE>

" Create 80-character line like in most IDEs
if exists('+colorcolumn') "{{{2
    setlocal colorcolumn=80
endif
"}}}2

" Foldmethod{{{2
setlocal foldmethod=syntax
"}}}2

"}}}1

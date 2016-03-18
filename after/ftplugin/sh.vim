" File: ~/.vim/after/ftplugin/sh.vim
"{{{1

" Mappings to comment and uncomment{{{2
nnore <buffer> <localleader>c mqI#<ESC>`q
nnore <buffer> <localleader>nc mq^x`q
"}}}2

" Create 80-character line like in most IDEs
if exists('+colorcolumn') "{{{2
    setlocal colorcolumn=80
endif
"}}}2

" Foldmethod{{{2
setlocal foldmethod=syntax
"}}}2

"}}}1

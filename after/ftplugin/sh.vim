" File: ~/.vim/after/ftplugin/sh.vim
"{{{1

" Mappings to comment and uncomment
nnore <buffer> <localleader>c mqI#<ESC>`q
nnore <buffer> <localleader>nc mq^x`q

" Create 80-character line like in most IDEs
if exists('+colorcolumn') "{{{2
    setlocal colorcolumn=80
endif
"}}}2

"}}}1

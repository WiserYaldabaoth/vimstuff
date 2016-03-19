" File: ~/.vim/after/ftplugin/python.vim
"{{{1

" Mapping for a documentation comment{{{2
nnore <buffer> <localleader>dc o"""<CR><CR>"""<ESC>ka
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

" File: ~/.vim/after/ftplugin/python.vim
"{{{1

" Mappings to comment and uncomment
nnore <buffer> <localleader>c mqI#<ESC>`q
nnore <buffer> <localleader>nc mq^x`q

" Mapping for a documentation comment
nnore <buffer> <localleader>dc o"""<CR><CR>"""<ESC>ka

" Create 80-character line like in most IDEs
if exists('+colorcolumn') "{{{2
    setlocal colorcolumn=80
endif
"}}}2

"}}}1

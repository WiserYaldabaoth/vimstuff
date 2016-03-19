" File: ~/.vim/after/ftplugin/promela.vim
"{{{1

" Set commentstring{{{2
setlocal cms="/*%s*/"
"}}}2

" Mapping for a documentation comment{{{2
nnore <buffer> <localleader>dc o/**<CR><BS>*<ESC>jkka<SPACE>
"}}}2

" Add a semicolon to the end of the line{{{2
nnore <buffer> <localleader>sc mqA;<esc>`q
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

" File: ~/.vim/after/ftplugin/tex.vim
"{{{1

" Mappings to comment and uncomment{{{2
nnore <buffer> <localleader>c mqI%<ESC>`q
nnore <buffer> <localleader>nc mq^x`q
"}}}2

" Automatically compile the file while in trial with guile!{{{2
nnore <buffer> <localleader>b :%!pdflatex --output-directory=build<CR>
"}}}2

" Foldmethod{{{2
setlocal foldmethod=expr
"}}}2

" Check spelling when using LaTeX{{{2
setlocal spell
"}}}2

"}}}1

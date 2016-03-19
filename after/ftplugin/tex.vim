" File: ~/.vim/after/ftplugin/tex.vim
"{{{1

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

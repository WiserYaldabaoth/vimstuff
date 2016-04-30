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

" Define a command for pdflatex compilation {{{2
command! TexC new | r!pdflatex --interaction=nonstopmode --output-directory=build $(cygpath -w #:p) >> temp 2>&1 && cygstart #:p:h/build/#:r.pdf || cat temp ; rm ./temp
"}}}2

"}}}1

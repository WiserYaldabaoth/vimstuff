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
command! TexC new | exec " r!pdflatex --interaction=nonstopmode --output-directory=build $(cygpath -w " . expand( '#:p' ) . ") >> temp 2>&1 && cygstart " . expand( '#:p:h' ) . "/build/" . expand( '#:r' ) . ".pdf || cat temp ; rm ./temp"
command! TexCr exec "Dispatch pdflatex --interaction=nonstopmode --output-directory=build $(cygpath -w " . expand( '%:p' ) . ")"
"}}}2

" Set up command expansion {{{2
exec "setlocal dictionary+=" . $HOME . "/.vim/dictionaries/" . expand('<amatch>')
"}}}2

"}}}1

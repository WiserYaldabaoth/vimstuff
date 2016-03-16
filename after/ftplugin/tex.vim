" File: ~/.vim/after/ftplugin/tex.vim
"{{{1

" Mappings to comment and uncomment
nnore <buffer> <localleader>c mqI%<ESC>`q
nnore <buffer> <localleader>nc mq^x`q

" Automatically compile the file while in trial with guile!
nnore <buffer> <localleader>b :%!pdflatex --quiet --output-directory=build<CR>

"}}}1

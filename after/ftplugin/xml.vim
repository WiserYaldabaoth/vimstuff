" File: ~/.vim/after/ftplugin/xml.vim
" {{{1

" Prepare folding for xml{{{2
setlocal foldmethod=syntax
"}}}2

" Two spaces for indentation{{{2
setlocal tabstop=2
"}}}2

" Use xmllint for indentation fixing{{{2
setlocal equalprg=xmllint\ --format\ --recover\ -
"}}}2

" Extra commands{{{2
command! XmlFormat %!xmllint --format --recover - 2>/dev/null
command! XmlF XmlFormat
command! XmlCheck !xmllint --noout %
command! XmlC XmlCheck

" TODO Add quickfix functionality to below
command! -nargs=1 -complete=file_in_path XmlValidate !xmllint --noout --schema <args> %
"}}}2

" }}}1

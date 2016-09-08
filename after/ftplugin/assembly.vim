" File: ~/.vim/after/ftplugin/assembly.vim
" {{{1

" Tabs actually matter in assembly
set noexpandtab

" Set colorcolumn if not already there
if exists('+colorcolumn') "{{{2
    setlocal colorcolumn=80
endif
"}}}2

" Foldmethod {{{2
setlocal foldmethod=syntax
"}}}2

" }}}1

"vim:setlocal fen fdm=marker

"SETTINGS{{{1

"""" Customize toolbar{{{2
" Reduce icon size{{{3
set tbis=tiny
"}}}3
"}}}2
" GUI Options{{{2
" Enable and use menu, gray inactive menu items, and include tearoff menu
" items. Do NOT use the Toolbar or the scrollbar.
set go=egmrt
"}}}2
" Custom colorscheme{{{2
colo gruvbox
"}}}2
" Set up the font{{{2
" TODO Remove system-dependent functionality
set guifont='DejaVu\ Mono\ 10'
"}}}2
" MIN HEADROOM{{{2
set ghr=0
"}}}2

"}}}1
"PLUGINS{{{1

" Vimtex{{{2
let g:vimtex_latexmk_callback=1
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique @pdf'
let g:vimtex_view_general_options_latexmk = '--unique'
"}}}2
" Themes {{{2

"}}}2

"}}}1
"AFTER{{{1

" NOTHING HERE

"}}}1
"NOTES{{{1

" Nothing here

" }}}1

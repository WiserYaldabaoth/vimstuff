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
if(  has( 'win32unix' ) )
    set guifont='DejaVu\ Mono\ 10'
elseif( has( 'win32' ) )
    set guifont='Consolas'
else
    set guifont='Inconsolata'
endif
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

"}}}1
"{{{ Cursor Color Customizations → 
"These are based on blaenkdenum's cool
"mode aware cursor hack. For more, visit
"http://www.blaenkdenum.com/posts/a-simpler-vim-statusline/
"Set the cursor color according to the mode.
"This one should work for most Dark Themes 
hi ModeMsg guifg=#FD971F guibg=NONE gui=NONE
"set gcr=a:block
" mode aware cursors
set gcr+=o:hor50-Cursor
set gcr+=n:Cursor
set gcr+=i-ci-sm:InsertCursor
set gcr+=r-cr:ReplaceCursor-hor20
set gcr+=c:CommandCursor
set gcr+=v-ve:VisualCursor
hi InsertCursor  ctermfg=White guifg=#fdf6e3 ctermbg=Black guibg=#FD971F
hi VisualCursor  ctermfg=White guifg=#000000 ctermbg=Cyan guibg=#AE81FF
hi ReplaceCursor ctermfg=White guifg=#fdf6e3 ctermbg=Darkred guibg=#66D9EF
hi CommandCursor ctermfg=White guifg=#fdf6e3 ctermbg=Yellow guibg=#A6E22E
"--------------------------------------------------------------
"}}}

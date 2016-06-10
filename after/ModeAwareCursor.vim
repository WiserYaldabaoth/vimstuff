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

" Create default statusline
fun! DefaultStatusline()
    set statusline=%t       "tail of the filename
    set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
    set statusline+=%{&ff}] "file format
    set statusline+=%h      "help file flag
    set statusline+=%m      "modified flag
    set statusline+=%r      "read only flag
    set statusline+=%y      "filetype

    if( exists('g:loaded_fugitive') && g:loaded_fugitive ==# 1 )
        set statusline+=%{fugitive#statusline()} " Add fugitive info
    endif

    set statusline+=%=      "left/right separator
    set statusline+=%c,     "cursor column
    set statusline+=%l/%L   "cursor line/total lines
    set statusline+=\ %P    "percent through file
endfun


" Create custom statusline for airline settings
fun! CustomAirline()
    let g:airline_section_a = airline#section#create(['%t'])   " filename tail
    let g:airline_section_b = airline#section#create(['ffenc','hunks','%f']) " get file encoding
    let g:airline_section_c = airline#section#create(['%{&ff}'])  " file format
    let g:airline_section_d = airline#section#create(['%h'])   " help file flag
    let g:airline_section_e = airline#section#create(['%m'])   " modified flag
    let g:airline_section_f = airline#section#create(['%r'])   " read-only flag
    let g:airline_section_g = airline#section#create(['filetype']) " filetype
    let g:airline_section_h = airline#section#create(['mode',' ','branch']) " git branch info

    let g:airline_section_x = airline#section#create(['%c,'])  " cursor column
    let g:airline_section_y = airline#section#create_right(['%l/%L']) " cursor line/total lines
    let g:airline_section_z = airline#section#create(['%P'])  " percent through file
endfun


" Create the statusline based on whether airline exists
fun! BuildStatusline()
    if( exists('g:loaded_airline') && g:loaded_airline ==# 1 )
        "call CustomAirline()
    else
        call DefaultStatusline()
    endif
    set laststatus=2  " no matter what, show statusline always
endfun


" Automatically load statusline based on params
augroup statusline
    autocmd!
    au VimEnter * :call BuildStatusline()
augroup END

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

    set statusline+=%{eclim#project#util#ProjectStatusLine()}]

    set statusline+=%=      "left/right separator
    set statusline+=%c,     "cursor column
    set statusline+=%l/%L   "cursor line/total lines
    set statusline+=\ %P    "percent through file
endfun


" Create custom statusline for airline settings.
" Contents partially inspired by the following website:
" http://www.blaenkdenum.com/posts/a-simpler-vim-statusline/.
fun! CustomAirline()
    " Ensure we can do stuff first
    if(!exists('g:airline_symbols'))
        let g:airline_symbols = {}
    endif

    " Unicode separators so terminal can understand
    let g:airline_left_sep = '»'
    let g:airline_right_sep = '«'
    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.branch = ''
    let g:airline_symbols.whitespace = 'Ξ'
    let g:airline_symbols.readonly = '!!'

    fun! Modified()
        return &modified ? " +" : ''
    endfun

    call airline#parts#define_raw('filename', '%<%f')
    call airline#parts#define_function('modified', 'Modified')

    let g:airline_section_b = airline#section#create(['filename'])  " Redefined filename
    let g:airline_section_c = airline#section#create(['branch'])    " Git
    let g:airline_section_gutter = airline#section#create(['modified', '%=']) " Show if modified or not
    let g:airline_section_x = airline#section#create_right(['%c'])     " Blank space
    let g:airline_section_y = airline#section#create_right(['%l/%L'])   " Display the column
    let g:airline_section_z = airline#section#create(['%p%%'])  " File percent

    " Truncate the width of the named sections.
    let g:airline#extensions#default#section_truncate_width = {
      \ 'x': 60,
      \ 'y': 60
      \ }

    " Change the mode display to a single letter.
    let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'v'  : 'V',
      \ 'V'  : 'V-L',
      \ 'c'  : 'C',
      \ '' : 'V-B',
      \ 's'  : 'S',
      \ 'S'  : 'S-L',
      \ '' : 'S-B',
      \ }
endfun


" Create the statusline based on whether airline exists
fun! BuildStatusline()
    if( exists('g:loaded_airline') && g:loaded_airline ==# 1 )
        call CustomAirline()
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

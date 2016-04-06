" File: ~/.vim/after/BuildStatusline.vim
"{{{1

" Create default statusline
fun! DefaultStatusline() "{{{2
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
"}}}2


" Create custom statusline for airline settings.
" Contents partially inspired by the following website:
" http://www.blaenkdenum.com/posts/a-simpler-vim-statusline/.
fun! CustomAirline() "{{{2
    " Ensure we can do stuff first
    if(!exists('g:airline_symbols'))
        let g:airline_symbols = {}
    endif

    let g:airline_powerline_fonts = 0

    " Unicode separators so terminal can understand{{{3
    let g:airline_left_sep = '»'
    let g:airline_right_sep = '«'
    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.branch = ''
    let g:airline_symbols.whitespace = 'Ξ'
    let g:airline_symbols.readonly = '!!'
    "}}}3

    fun! Modified() "{{{3
        return &modified ? " +" : ''
    endfun
    "}}}3

    " Define sections{{{3
    call airline#parts#define_raw('filename', '%<%f')
    call airline#parts#define_function('modified', 'Modified')

    let g:airline_section_b = airline#section#create(['filename'])  " Redefined filename
    let g:airline_section_c = airline#section#create(['branch'])    " Git
    let g:airline_section_gutter = airline#section#create(['modified', '%=']) " Show if modified or not
    let g:airline_section_x = airline#section#create_right(['%c'])     " Display column
    let g:airline_section_y = airline#section#create_right(['%l/%L'])   " Current line / total lines
    let g:airline_section_z = airline#section#create(['%p%%'])  " File percent

    " Truncate the width of the named sections.
    let g:airline#extensions#default#section_truncate_width = {
      \ 'x': 60,
      \ 'y': 60
      \ }
    "}}}3

    " Change the mode display to a single letter.{{{3
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
    "}}}3

    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'
    let g:airline#extensions#eclim#enabled = 1
endfun
"}}}2


" Create the statusline based on whether airline exists
fun! BuildStatusline() "{{{2
    if( exists('g:loaded_airline') && g:loaded_airline ==# 1 )
        call CustomAirline()
    else
        call DefaultStatusline()
    endif
    set laststatus=2  " no matter what, show statusline always
endfun
"}}}2


" Automatically load statusline based on params
augroup statusline "{{{2
    autocmd!
    au VimEnter * :call BuildStatusline()
augroup END
"}}}2
"}}}1

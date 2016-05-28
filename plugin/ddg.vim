" File: plugin/ddg.vim
" Description: Search for the selection via ddg.gg with dK.
" Maintainer: Brian A Mejorado <bam9523@rit.edu>

nnoremap dK :set operatorfunc=<SID>DuckDuckGo<CR>g@
vnoremap dK :<c-u>call <SID>DuckDuckGo(visualmode())<cr>

" ToQuery
"
" Turns input into an appropriate query.
fun! s:ToQuery(input) "{{{1
    " :s/\v[^a-zA-Z0-9{}()+. ]//g
    "    \ | s/\v[{}() ]/+/g
    "    \ | s/(+)\{2,}//g
    " Clear out illegal URL symbols
    " Then turn delimiters into query splitters
    " Then eliminate plus sign duplicates
    return substitute(
                \ substitute(
                \     substitute(
                \         shellescape(expand(a:input)),
                \         "[^a-zA-Z0-9{}()+. ]",
                \         "",
                \         'g'
                \         ),
                \     "[{}() ]",
                \     "+",
                \     'g'
                \     ),
                \ "+\{2,}",
                \ "+",
                \ 'g'
                \ )
endfun!
"}}}1


" DuckDuckGo
"
" Defines an operator to DuckDuckGo a motion.
" Also appends the current filetype to the search.
fun! s:DuckDuckGo(curmode) "{{{1
    let l:saved = @@

    if a:curmode ==# 'v'
        execute "normal! `<v`>y"
    elseif a:curmode ==# 'char'
        execute "normal! `[v`]y"
    endif

    let l:url = "https://duckduckgo.com?q=" . <SID>ToQuery(&ft) . "+" . <SID>ToQuery(@@) . "&ia=web"

    let @@ = l:saved

    " TODO Add more browser options
    if( executable( 'lynx' ) )
        execute '!lynx -vikeys "' . l:url . '"'
    elseif( executable( 'open' ) )
        execute '!open "' . l:url . '"'
    elseif( executable( 'start' ) )
        execute '!start "' . l:url . '"'
    elseif( executable( 'cygstart' ) )
        execute '!cygstart "' . l:url . '"'
    endif
endfun
" }}}1

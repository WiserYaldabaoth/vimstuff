" File: ~/.vim/after/ftplugin/c.vim
"{{{1

" Mappings for documentation comments{{{2
nnore <buffer> <localleader>dc o/**<CR><BS>*<ESC>jkka<SPACE>
"}}}2

" Add a semicolon to the end of the line{{{2
nnore <buffer> <localleader>sc mqA;<esc>`q
"}}}2

" Prototype generation {{{2
function! GeneratePrototypes() "{{{3
    execute "silent !ctags --fields=+KS ".expand("%")
    redraw!
    let list = taglist('.*')
    let line = line(".")
    for item in list
        if item.kind == "function"  &&  item.name != "main"
            let name = item.name
            let retType = item.cmd
            let retType = substitute( retType, '^/\^\s*','','' )
            let retType = substitute( retType, '\s*'.name.'.*', '', '' )

            if has_key( item, 'signature' )
                let sig = item.signature
                let sig = substitute( sig, '\s*\w\+\s*,',        ',',   'g')
                let sig = substitute( sig, '\s*\w\+\(\s)\)', '\1', '' )
            else
                let sig = '()'
            endif
            let proto = retType . "\t" . name . sig . ';'
            call append( line, proto )
            let line = line + 1
        endif
    endfor
endfunction
"}}}3
function! GeneratePrototypesFullSignature() "{{{3
    "execute "silent !ctags --fields=+KS ".expand("%")
    let dir = expand("%:p:h");
    execute "silent !ctags --fields=+KSi --extra=+q".dir."/* "
    redraw!
    let list = taglist('.*')
    let line = line(".")
    for item in list
        if item.kind == "function"  &&  item.name != "main"
            let name = item.name
            let retType = item.cmd
            let retType = substitute( retType, '^/\^\s*','','' )
            let retType = substitute( retType, '\s*'.name.'.*', '', '' )

            if has_key( item, 'signature' )
                let sig = item.signature
            else
                let sig = '(void)'
            endif
            let proto = retType . "\t" . name . sig . ';'
            call append( line, proto )
            let line = line + 1
        endif
    endfor
endfunction
"}}}3
" N:<localleader>pro     Generate prototypes {{{3
nnore <buffer> <localleader>pro :call GeneratePrototypes()<CR>
"}}}3
" N:<localleader>proful  Generate full prototypes {{{3
nnore <buffer> <localleader>proful :call GeneratePrototypesFullSignature()<CR>
"}}}3
"}}}2

" Foldmethod{{{2
setlocal foldmethod=syntax
"}}}2

" Create 80-character line like in most IDEs {{{2
if exists('+colorcolumn')
    setlocal colorcolumn=80
endif
"}}}2

"}}}1

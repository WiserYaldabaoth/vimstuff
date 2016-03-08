" Usage: in normal mode, where you want the prototypes to be pasted:
":call GeneratePrototypes()
function! GeneratePrototypes() "{{{1
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
"}}}1


function! GeneratePrototypesFullSignature() "{{{1
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
"}}}1


" Mappings to quickly call autogen prototypes
augroup cprototypes "{{{1
    autocmd!
    au Filetype c   nnore <buffer> <localleader>pro :call GeneratePrototypes()<CR>
    au Filetype c   nnore <buffer> <localleader>proful :call GeneratePrototypesFullSignature()<CR>
augroup END
"}}}1

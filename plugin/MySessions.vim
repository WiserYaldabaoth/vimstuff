"File: MySessions.vim
"
" Description: Automatically save and load sessions to a specialized directory. 
"
" Idea acquired from https://stackoverflow.com/a/31978241


" MakeSession
"
" This function creates a session file for the current directory.
function! s:MakeSession() "{{{1
    let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
    if (filewritable(b:sessiondir) != 2)
        exe 'silent !mkdir -p ' b:sessiondir
        redraw!
    endif
    let b:filename = b:sessiondir . '/session.vim'
    exe "mksession! " . b:filename
endfunction
"}}}1


" LoadSession
"
" This function loads an existing session file for the current directory.
function! s:LoadSession() "{{{1
    let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
    let b:sessionfile = b:sessiondir . "/session.vim"
    if (filereadable(b:sessionfile))
        exe 'source ' b:sessionfile
    else
        echo "No session loaded."
    endif
endfunction
"}}}1


" Automatically try to load a session when calling vim without args
if (argc() ==# 0 )
    au VimEnter * nested :call <SID>LoadSession()
endif

" Automatically create a session file when leaving vim
au VimLeave * :call <SID>MakeSession()


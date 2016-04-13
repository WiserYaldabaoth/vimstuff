"File: MySessions.vim
"
" Description: Automatically save and load sessions to a specialized directory.
"
" Idea acquired from https://stackoverflow.com/a/31978241
"{{{1


" MakeSession
"
" This function creates a session file for the current directory.
function! s:MakeSession() "{{{2
    " TODO Make below portion work
    " Don't create a session within ./vim/sessions.{{{3
    if ( matchstr(getcwd(), $HOME . "/.vim/sessions/"))
        echo 'No session created.'
        finish
    endif
    "}}}3

    " Find the session directory or create it.{{{3
    let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
    if (filewritable(b:sessiondir) != 2)
        exe 'silent !mkdir -p ' b:sessiondir
        redraw!
    endif
    "}}}3

    " Make the session for the current directory.{{{3
    let b:filename = b:sessiondir . '/session.vim'
    exe "mksession! " . b:filename
    "}}}3
endfunction
"}}}2


" LoadSession
"
" This function loads an existing session file for the current directory.
function! s:LoadSession() "{{{2
    let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
    let b:sessionfile = b:sessiondir . "/session.vim"
    if (filereadable(b:sessionfile))
        exe 'source ' b:sessionfile
    else
        echo "No session loaded."
    endif
endfunction
"}}}2

" Automatically try to load a session when calling vim without args"{{{2
if (argc() ==# 0 )
    au VimEnter * nested :call <SID>LoadSession()
endif
"}}}2

" Automatically create a session file when leaving vim{{{2
au VimLeave * :call <SID>MakeSession()
"}}}2

"}}}1

" MySessions.vim
"
" This file contains functions to automatically save and load new sessions to a
" specialized directory in .vim settings dir. 
"
" Idea acquired from https://stackoverflow.com/a/31978241


" MakeSession
"
" This function creates a session file for the current directory.
function! MakeSession() "{{{1
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
function! LoadSession() "{{{1
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
    au VimEnter * nested :call LoadSession()
endif

" Automatically create a session file when leaving vim
au VimLeave * :call MakeSession()


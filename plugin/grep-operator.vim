" File: grep-operator.vim
" Description: A plugin for providing a grep operator in vim. 
" With two keystrokes, you can search from a motion!

nnoremap <leader>g :set operatorfunc=<SID>GrepOperator<cr>g@
vnoremap <leader>g :<c-u>call <SID>GrepOperator(visualmode())<cr>

" GrepOperator
"
" Defines an operator for external grep of a motion.
fun! s:GrepOperator(type) "{{{1
    " Be considerate; save and restore settings
    let saved_unnamed_register = @@

    if a:type ==# 'v'
        execute "normal! `<v`>y"
    elseif a:type ==# 'char'
        execute "normal! `[v`]y"
    else
        echom "EXECUTE ORDER 66"
        return
    endif
    
    silent exe "grep! -R " . shellescape(expand(@@)) . " ."
    copen

    let @@ = saved_unnamed_register
endfun
"}}}1

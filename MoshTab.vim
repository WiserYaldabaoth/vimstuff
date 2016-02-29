" MoshTab.vim
"
" A simple file for helping tab-based autocomplete to determine whether
" to place a word or an actual tab.
"
" Idea taken from http://stackoverflow.com/a/257444.


" Mosh_Tab_Or_Complete
"
" Based on the current line, determines whether to input a tab or a 
" Ctrl+N. 
function! Mosh_Tab_Or_Complete()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-N>"
    else
        return "\<Tab>"
endfunction


" Run Mosh_Tab_Or_Complete with each tab
inoremap <Tab> <C-R>=Mosh_Tab_Or_Complete()<CR>

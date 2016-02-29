" MoshTab.vim
"
" A simple file for helping tab-based autocomplete to determine whether
" to place a word or an actual tab.
"
" Idea taken from http://stackoverflow.com/a/257444.


let g:MoshTabToggle=1   " Setting to toggle mosh tabs or not


" Mosh_Tab_Or_Complete
"
" Based on the current line, determines whether to input a tab or a 
" Ctrl+N. 
function! Mosh_Tab_Or_Complete()
    if g:MoshTabToggle && col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-N>"
    else
        return "\<Tab>"
endfunction



" Mosh_Tab_Toggle
"
" Toggles whether or not Mosh Tab behavior should occur.
function! Mosh_Tab_Toggle()
    if g:MoshTabToggle
        let g:MoshTabToggle=0
    else
        let g:MoshTabToggle=1
    endif
endfunction



" Toggle setting
nnoremap <leader>mosh :call Mosh_Tab_Toggle()<CR>


" Run Mosh_Tab_Or_Complete with each tab
inoremap <Tab> <C-R>=Mosh_Tab_Or_Complete()<CR>

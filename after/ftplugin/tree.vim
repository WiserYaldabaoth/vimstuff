" File: ~/.vim/after/ftplugin/tree.vim
"{{{1

" Function for folding tree output
func! FoldTree(lnum)
    let ind = match(getline(a:lnum),'├\|└')/4+1
    let indn = match(getline(a:lnum+1),'├\|└')/4+1
    return indn>ind ? '>'.ind : ind-1
endfunc

" Set folding for easy reading
setl fen fdm=expr fde=FoldTree(v:lnum) 

"}}}1

" File: ~/.vim/after/ftplugin/java.vim
"{{{1

" Mappings for documentation comments{{{2
nnore <buffer> <localleader>dc o/**<CR><BS>*<ESC>jkka<SPACE>
"}}}2

" Add a semicolon to the end of the line{{{2
nnore <buffer> <localleader>sc mqA;<esc>`q
"}}}2

" Create 80-character line like in most IDEs
if exists('+colorcolumn') "{{{2
    setlocal colorcolumn=80
endif
"}}}2

" Foldmethod{{{2
setlocal foldmethod=syntax
"}}}2

" Don't add comment prefix when hitting enter on a comment line{{{2
setlocal formatoptions -=cor
"}}}2

" Include annotations inside folds{{{2
syn region javaFuncDef start="^\z(\s*\)\%(@[A-Z]\k*\%((\_.\{-})\)\?\_s*\)*\%(\%(public\|protected\|private\|static\|abstract\|final\|native\|synchronized\)[ \n]\+\)*\%(void\|boolean\|char\|byte\|short\|int\|long\|float\|double\|\%([A-Z][$A-Za-z0-9_]*\%(\_s*<\_s*[$A-Za-z0-9,_ <]\+\_s*>\%(\_s*>\)*\_s*\)\?\)\)\_s\+\%([a-zA-Z$0-9_][$A-Za-z0-9_]*\)\_s*(\_[^)]*)\_s*\%(throws\_s\+[A-Z]\k\+\%(\_s*,\_s*[A-Z]\k\+\)*\_s\{-}\)\?\_s*{" end="^\z1}\s*$" keepend transparent fold
"}}}2

" Fold import statements{{{2
syn keyword javaExternal native package
syn region foldImports start=/\(^\s*\n^import\)\@<= .\+;/ end=+^\s*$+ transparent fold keepend
"}}}2

"" Fold comments{{{2
" syn clear javaComment
" syn region javaComment start=+/\*+ end=+\*/+  contains=@javaCommentSpecial,javaTodo,@Spell transparent fold keepend
" syn match javaComment '+/\*\*/+'
" hi def link javaComment Comment
""}}}2

" Add command to generate Serial Version ID {{{2
" WARNING: Untested. May not work.

" s:InputSerial
" Generates a SerialVer number and inputs it. {{{3
fun! s:InputSerial(classpath, classname) abort
    " r! serialver -classpath bin $(echo %:r | sed -e 's/src\///' -e 's/\//\./g')
    let l:command = "r! serialver "

    if( exists( 'a:classpath' ) && a:classpath !=# '' )
        let l:command .= "-classpath " . a:classpath . " "
    endif

    let l:command .= "$(echo " . a:classname . " | sed -e 's@src\/@@' -e 's@\/@\.@g')"
    exec l:command
endfun
"}}}3

command! -nargs=? -complete=dir Serial call <SID>InputSerial(expand("<args>"), expand("<afile>:r"))

"}}}2

"}}}1

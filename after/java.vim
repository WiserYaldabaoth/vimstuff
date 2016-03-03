" Don't add comment prefix when hitting enter on a comment line
set formatoptions -=cor

" Include annotations inside folds
syn region javaFuncDef start="^\z(\s*\)\%(@[A-Z]\k*\%((\_.\{-})\)\?\_s*\)*\%(\%(public\|protected\|private\|static\|abstract\|final\|native\|synchronized\)[ \n]\+\)*\%(void\|boolean\|char\|byte\|short\|int\|long\|float\|double\|\%([A-Z][$A-Za-z0-9_]*\%(\_s*<\_s*[$A-Za-z0-9,_ <]\+\_s*>\%(\_s*>\)*\_s*\)\?\)\)\_s\+\%([a-zA-Z$0-9_][$A-Za-z0-9_]*\)\_s*(\_[^)]*)\_s*\%(throws\_s\+[A-Z]\k\+\%(\_s*,\_s*[A-Z]\k\+\)*\_s\{-}\)\?\_s*{" end="^\z1}\s*$" keepend transparent fold


" Fold import statements
syn keyword javaExternal native package
syn region foldImports start=/\(^\s*\n^import\)\@<= .\+;/ end=+^\s*$+ transparent fold keepend

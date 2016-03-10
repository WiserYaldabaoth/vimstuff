" .vimrc

"stng"""""""""""""s1
""""""""""""""""""""
"_____SETTINGS_____"
"""""""""""""""""{{{1

" Pathogen

let g:pathogen_disabled = []

"call add(g:pathogen_disabled, 'LatexBox')
"call add(g:pathogen_disabled, 'vim-airline')
"call add(g:pathogen_disabled, 'vim-fugitive')
"call add(g:pathogen_disabled, 'tagbar')

let g:loaded_airline = 0
"let g:loaded_fugitive = 0


" Check if pathogen exists before running it
if filereadable(expand("~/.vim/autoload/pathogen.vim"))
    runtime! autoload/pathogen.vim
    if exists("g:loaded_pathogen")
       call pathogen#infect()
       call pathogen#helptags()
    endif
endif

set nocompatible             " VIM ONLY, NO VI ALLOWED
syntax on                    " Set syntax highlighting
filetype plugin indent on
let mapleader = ","          " Leader for mapping
set shell=/bin/bash



"In case /tmp get's clean out, make a new tmp directory for vim:
:command! Mktmpdir call mkdir(fnamemodify(tempname(),":p:h"),"",0700)


" These are for my sanity when loading modified vimrc in Sessions
set ssop-=options            " DO NOT STORE GLOBAL/LOCAL VARIABLES IN SESSION
set ssop-=folds              " DO NOT STORE FOLDS IN SESSION

set background=light         " Modify syntax highlighting color schemes

set showcmd                  " Show typed commands
set cmdheight=2              " Commandline height of 2 lines

set showmatch                " Show matching pairs of brackets

set ruler                    " Show line number on the bar
set number                   " Show lines on side of screen

set ai                       " Autoindent
set si                       " Smartindent

set cul                      " Highlight current line

set incsearch                " Highlight matched regexps during search entry

set scrolloff=0              " Always keep cursor in center

set vb t_vb=                 " I don't want beeps


" Folding
" Common key bindings:
" za - toggles folding
" zc - closes a fold
" zo - opens a fold
" zR - opens all folds
" zM - closes all folds
set foldmethod=syntax        " Fold based on syntax files
set foldnestmax=10           " Deepest nesting is 10 levels
set nofoldenable             " Don't automatically fold
set foldlevel=1


" Vim recognizes shell alias commands
let $BASH_ENV = "~/.bash_aliases"

" Vim looks for project-specific tags
set tags=./tags,tags;

" Keep style for autoindent
set copyindent               " Copy indent of last line
set preserveindent           " Keep indent at same level

set backspace=2  " Fix backspace behavior in vim


if has("gui_running")
    "echo "Yes, we have a GUI"
    set mouse=a
else
    "echo "Just a boring console"
    set mouse=
endif


" Set up command expansion for LaTeX
augroup LaTeXexp "{{{2
    autocmd!
    autocmd FileType * :exec("setlocal dictionary+=".$HOME."/.vim/dictionaries/".expand('<amatch>'))
augroup END
"}}}2
set completeopt=menuone,longest,preview
set complete+=k


" Make comments more readable
hi Comment ctermfg=Cyan
hi Search cterm=NONE ctermfg=black ctermbg=blue
hi Visual cterm=NONE ctermfg=black ctermbg=lightgray
hi Folded cterm=NONE ctermfg=black ctermbg=darkgray


" Don't always create newline comments
augroup change_fo
    autocmd!
    au Filetype * set fo-=c fo-=r fo-=o
augroup END


" Tab behavior

" Grab current file name and see if it is a makefile
let _curfile = expand("%:t")
if _curfile =~ "Makefile" || _curfile =~ "makefile" || _curfile =~ ".*\.mk"
    set noexpandtab              " We want proper tabs in makefiles!
else                             " but if it isn't a makefile...
    set expandtab                " turn tabs into spaces
    set tabstop=4 shiftwidth=4   " tab length is 4
endif


" Create 80-character line like in most IDEs
if exists('+colorcolumn') "{{{2
    augroup coloring
        autocmd!
        au Filetype java,c,cpp,c#,python,ruby,sh,promela set colorcolumn=80
    augroup END
else
    augroup nocolor_error
        autocmd!
        au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>81v.\+', -1)
    augroup END
endif
"}}}2


" TODO Reduce this to a single function and some language plugins for
" <leader>c mapping
augroup comments "{{{2
    autocmd!

    " Automatically comment out a line in the given filetypes
    au Filetype java,c,cpp,c#   nnore <buffer> <localleader>c mqI//<ESC>`q
    au Filetype python,ruby,sh  nnore <buffer> <localleader>c mqI#<ESC>`q
    au Filetype promela         nnore <buffer> <localleader>c mqI/* <ESC>$a */<ESC>`q
    au Filetype tex             nnore <buffer> <localleader>c mqI%<ESC>`q
    au Filetype vim             nnore <buffer> <localleader>c mqI"<ESC>`q

    " Automatically uncomment a line in the given filetypes
    au Filetype java,c,cpp,c#   nnore <buffer> <localleader>nc mq^xx`q
    au Filetype python,ruby,sh  nnore <buffer> <localleader>nc mq^x`q
    au Filetype promela         nnore <buffer> <localleader>nc mq^xx$XX^`q
    au Filetype tex             nnore <buffer> <localleader>nc mq^x`q
    au Filetype vim             nnore <buffer> <localleader>nc mq^x`q

    " TODO Automatically produce a doc comment
    au Filetype java,c,promela,c#  nnore <buffer> <localleader>dc o/**<CR><BS>*<ESC>jkka<SPACE>
    au Filetype python             nnore <buffer> <localleader>dc o"""<CR><CR>"""<ESC>ka
augroup END
"}}}2


 "Add a semicolon to the end of a line
augroup semicolon "{{{2
    autocmd!
    au Filetype java,c,cpp nnore <buffer> <localleader>sc mqA;<esc>`q
augroup END
"}}}2


augroup latexstuff "{{{2
    autocmd!
    au Filetype tex  nnore <buffer> <localleader>b :%!pdflatex --quiet --output-directory=build<CR>
augroup END
"}}}2



"}}}1
"fnc""""""""""""""""s2
""""""""""""""""""""""
"-----FUNCTIONS------"
"""""""""""""""""""{{{1

" CenterToggle()
"
" Toggles whether the cursor should appear in the center.
" Returns falsey if scrolloff is not 9999 or 0.
:function! CenterToggle() "{{{2
:    if !exists("&scrolloff")
:        echom "scrolloff dons exits!"
:        return 0
:    elseif &scrolloff ==# 0
:        set scrolloff=9999
:        echom "Cursor is now centered."
:        return 1
:    elseif &scrolloff ==# 9999
:        set scrolloff=0
:        echom "Cursor is now uncentered."
:        return 1
:    else
:        echom "scrolloff setting must be 0 or 9999 for toggle."
:        return 0
:    endif
:endfunction
"}}}2


" RefreshVim()
"
" Re-sources the vimrc document and toggles any settings that need to be
" re-toggled afterward.
:if !exists("*RefreshVim") "{{{2
:    function! RefreshVim()
:        source $MYVIMRC
:        if( g:loaded_airline ==# 1 )
:            AirlineRefresh
:        endif
:    endfunction
:    command! Recfg call RefreshVim()
:endif
"}}}2



"}}}1
"rmp""""""""""""""""s3
""""""""""""""""""""""
"-----REMAPPINGS-----"
"""""""""""""""""""{{{1


" Retab automatically reconfigures tabs to spaces
noremap <F2> :retab <CR>


" Remap command starter to save button presses
"""""" THIS IS MY SECOND FAVORITE MAPPING IN THE UNIVERSE
nore ; :

" Set search mapping so that next found in search centers on line
noremap N Nzz
noremap n nzz

" Open tag definition in a new tab with ctrl+\
noremap <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Insert a single character
nnoremap <Space> i_<C-C>r

" Insert a single character into a block selection
" OR: Replace an entire selection with a single selection
vnoremap <Space> I_<ESC>gvr

" Escape with jk
"""""" THIS IS MY FAVORITE MAPPING IN THE UNIVERSE
inoremap jk <ESC>
inoremap JK <ESC>
inoremap jK <ESC>
inoremap Jk <ESC>

inoremap kj <ESC>
inoremap Kj <ESC>
inoremap kJ <ESC>
inoremap KJ <ESC>

" Fix <M-]> behavior
set <M-]>=^[]

" Open tag definition in vertical split with alt+]
noremap <M-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>


""""" A TOOL FOR LEARNING 'THE VIM WAY'
""""" USE MAPPING TO DISABLE ARROW KEYS!
"noremap <up> <nop>
"noremap <down> <nop>
"noremap <left> <nop>
"noremap <right> <nop>

"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>



""""" USE THIS AFTER TRAINING YOURSELF OUT OF ARROW KEYS
" Left and right arrow keys are for moving tabs...
nnoremap <left> <C-C>:tabp<CR>
nnoremap <right> <C-C>:tabn<CR>


" Up and down arrow keys are for moving buffers
nnoremap <up> <C-C>:bp<CR>
nnoremap <down> <C-C>:bn<CR>


" Alternatively, use arrow keys for moving about windows
" It's really up to you how you use them!
nnoremap <leader><left>  <C-W>h
nnoremap <leader><right> <C-W>l
nnoremap <leader><up>    <C-W>j
nnoremap <leader><down>  <C-W>k



""""""" THIS MAPPING DISABLES ESC IN INSERT MODE
" 'If Escape is your friend, why is it so far away from you?'
inoremap <ESC> <nop>



" _s_ource my _v_imrc file
nnoremap <leader>sv :call RefreshVim()<CR>

" _e_dit my _v_imrc file in a new window split
nnoremap <leader>ev :vsp $MYVIMRC <CR>


" Surround a word in quotes in normal mode
nnoremap <leader>" viW<ESC>a"<ESC>hbi"<ESC>lel

" Surround a word in quotes in visual mode
"vnoremap <leader>" i`<


" Toggle spellcheck on/off
nnoremap <leader>ss :set spell!<CR>


" Save current session
nnoremap <leader>ses :mkses!<CR>


" Make
nnoremap <leader>m :make<CR>


" Switch windows quickly, no control required
nnoremap <leader>w <C-W>


" Suggestions pop up
inoremap <leader><leader> <C-P>


" Center cursor automagically
nnoremap <leader>cc  :call CenterToggle()<CR>


" ffffuuuuuu
"nnoremap <leader>fuuuuu :exec "normal! qqqqqifuu\<lt>Esc>h@qq@q"<cr>


" Insta-open explorer to show adjacent files
" This provides seamless browsing of complex directory structures,
" as the same button moves up one directory!
nnoremap - :Explore<CR>


" Remove highlight after search
nnoremap <leader>h :noh<CR>


" Operator for 'inside next parantheses'
onoremap in( :<C-U>normal! f(vi(<CR>


" Operator for 'inside last parentheses'
onoremap il( :<C-U>normal! F)vi(<CR>


" Operator for 'around next parentheses'
" onoremap an( :<C-U>normal! f(vib<CR>

" Operator for 'around last parentheses'
" onoremap al( :<C-U>normal! F)viW<CR>




"}}}1
"abbr""""""""""""""s4
"""""""""""""""""""""
"---ABBREVIATIONS---"
""""""""""""""""""{{{1


" Email abbrevation
iabbrev @@     bam9523@rit.edu

" Name abbreviation
iabbrev mname  Brian Alexander Mejorado



"}}}1
"plgn"""""""""""""s5
""""""""""""""""""""
"-----PLUGINS------"
"""""""""""""""""{{{1


" LatexBox

let g:LatexBox_latexmk_options = "-pvc -pdf -output-directory=build"
let g:LatexBox_viewer = "C:\Program Files\Tracker Software\PDF Viewer\PDFXCview.exe"





" Quickstart Tagbar
nnoremap <F8> :TagbarToggle<CR>


" Quickstart Tagbar in autoclose mode
nnoremap <leader>tt :TagbarOpenAutoClose<CR>


" Prepare Tagbar for TeX.
" Idea borrowed from https://stackoverflow.com/q/26145505.
" Note that this requires a .ctags file that is appropriately prepared.
let g:tagbar_type_tex = {
    \ 'ctagstype' : 'plaintex',
    \ 'kinds'     : [
        \ 's:sections',
        \ 'g:graphics:0:0',
        \ 'l:labels',
        \ 'r:refs:1:0',
        \ 'p:pagerefs:1:0'
    \ ],
    \ 'sort'    : 0,
\ }


" For eclim installations
let g:EclimCompletionMethod = 'omnifunc'


" Define some mappings
try "{{{2
    silent! PingEclim   " Triggers error before defining mappings
    " Eclim General
    " leader = <leader>ec
    nnoremap <leader>ecp :Projects<CR>
    nnoremap <leader>ecd :ProjectProblems<CR>
    nnoremap <leader>ecb :Buffers<CR>
    nnoremap <leader>ecl :LocateFile<CR>

    " Eclim Java
    " leader = <leader>ja
    nnoremap <leader>jaf :%JavaFormat<CR>
    nnoremap <leader>jai :JavaImportOrganize<CR>
    nnoremap <leader>jan :JavaRename<CR>
catch
    echom "No Eclim daemon configured. No Eclim mappings made."
endtry
"}}}2


" Supertab customization
if has("autocmd") && exists("+omnifunc") " prepare omnifunc
autocmd Filetype *
        \   if &omnifunc == "" |
        \       setlocal omnifunc=syntaxcomplete#Complete |
        \   endif
endif

" Disable preview window
set completeopt-=preview

" Use omnifunc for completion
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"


"}}}1
"ext""""""""""""""s6
""""""""""""""""""""
"-----EXTERNAL-----"
"""""""""""""""""{{{1

runtime MySessions.vim       " Provides automatic session behavior
"runtime MoshTab.vim          " Adds smart tab autocomplete
runtime CPrototypes.vim      " Prototype generation for C headers
runtime BuildStatusline.vim  " Load up custom statusline

" TODO Create a function for C-style languages :NewFunct
" usage will be :NewFunct [name] [returntype] [param1] [param2] ...
" In Java, will be :NewFunct [name] [returntype] [visibility] [params] ...
" Automatically produces docs and prototype
"}}}1

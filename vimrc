" .vimrc

"stng"""""""""""""s1
""""""""""""""""""""
"_____SETTINGS_____"
""""""""""""""""""""

set nocompatible             " VIM ONLY, NO VI ALLOWED
syntax on                    " Set syntax highlighting
filetype plugin indent on
let mapleader = ","          " Leader for mapping


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
autocmd FileType * exec("setlocal dictionary+=".$HOME."/.vim/dictionaries/".expand('<amatch>'))
set completeopt=menuone,longest,preview
set complete+=k


" Make comments more readable
hi Comment ctermfg=Cyan


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
if exists('+colorcolumn')
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


" Automatically comment out a line in the given filetypes
augroup comments
    autocmd!
    au Filetype java,c,cpp,c#   nnore <buffer> <localleader>c I//<ESC>
    au Filetype python,ruby,sh  nnore <buffer> <localleader>c I#<ESC>
    au Filetype promela  nnore <buffer> <localleader>c I/* <ESC>$a */<ESC>
    au Filetype tex      nnore <buffer> <localleader>c I%<ESC>
    au Filetype vim      nnore <buffer> <localleader>c I"<ESC>
augroup END


augroup latexstuff
    autocmd!
    au Filetype tex  nnore <buffer> <localleader>b :%!pdflatex --quiet --output-directory=build<CR>
augroup END



"fnc""""""""""""""""s2
""""""""""""""""""""""
"-----FUNCTIONS------"
""""""""""""""""""""""

" CenterToggle()
"
" Toggles whether the cursor should appear in the center.
" Returns falsey if scrolloff is not 9999 or 0.
:if !exists("*CenterToggle()")
:    function CenterToggle()
:        if !exists("&scrolloff")
:            echom "scrolloff dons exits!"
:            return 0
:        elseif &scrolloff ==# 0
:            set scrolloff=9999
:            echom "Cursor is now centered."
:            return 1
:        elseif &scrolloff ==# 9999
:            set scrolloff=0
:            echom "Cursor is now uncentered."
:            return 1
:        else
:            echom "scrolloff setting must be 0 or 9999 for toggle."
:            return 0
:        endif
:    endfunction
:endif





"rmp""""""""""""""""s3
""""""""""""""""""""""
"-----REMAPPINGS-----"
""""""""""""""""""""""


" Retab automatically reconfigures tabs to spaces
noremap <F2> :retab <CR>


" Remap command starter to save button presses
nore ; :

" Set search mapping so that next found in search centers on line
noremap N Nzz
noremap n nzz

" Open tag definition in a new tab with ctrl+\
noremap <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Insert a single character
nnoremap <Space> i_<C-C>r

" Escape with jj
inoremap jk <Esc>

" Fix <M-]> behavior
set <M-]>=^[]

" Open tag definition in vertical split with alt+]
noremap <M-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>


""""" A TOOL FOR LEARNING 'THE VIM WAY'
""""" USE MAPPING TO DISABLE ARROW KEYS!
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop> 

inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>


""""""" THIS MAPPING DISABLES ESC IN INSERT MODE
inoremap <ESC> <nop>


" _s_ource my _v_imrc file
nnoremap <leader>sv :source $MYVIMRC<CR>

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


" Operator for 'inside next parantheses'
onoremap in( :<C-U>normal! f(vi(<CR>


" Operator for 'inside last parentheses'
onoremap il( :<C-U>normal! F)vi(<CR>


" Operator for 'around next parentheses'
" onoremap an( :<C-U>normal! f(vib<CR>

" Operator for 'around last parentheses'
" onoremap al( :<C-U>normal! F)viW<CR>



"abbr""""""""""""""s4
"""""""""""""""""""""
"---ABBREVIATIONS---"
"""""""""""""""""""""


" Email abbrevation
iabbrev @@     bam9523@rit.edu

" Name abbreviation
iabbrev mname  Brian Alexander Mejorado




"plgn"""""""""""""s5
""""""""""""""""""""
"-----PLUGINS------"
""""""""""""""""""""


" LatexBox

let g:LatexBox_latexmk_options = "-pvc -pdf -output-directory=build"
let g:LatexBox_viewer = "C:\Program Files\Tracker Software\PDF Viewer\PDFXCview.exe"


" Pathogen

let g:pathogen_disabled = []

"call add(g:pathogen_disabled, 'LatexBox')

execute pathogen#infect()


" Quickstart Tagbar

nnoremap <F8> :TagbarToggle<CR>

let g:EclimCompletionMethod = 'omnifunc'

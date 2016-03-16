"vim:fen:fdm=marker

"SETTINGS{{{1

"" Pathogen{{{2

let g:pathogen_disabled = []

"call add(g:pathogen_disabled, 'LatexBox')
"call add(g:pathogen_disabled, 'vim-airline')
"call add(g:pathogen_disabled, 'vim-fugitive')
"call add(g:pathogen_disabled, 'vim-merginal')
"call add(g:pathogen_disabled, 'tagbar')
"call add(g:pathogen_disabled, 'supertab')
"call add(g:pathogen_disabled, 'vim-bufkill')
"call add(g:pathogen_disabled, 'minibufexpl')

"let g:loaded_airline = 0
"let g:loaded_fugitive = 0


" Check if pathogen exists before running it
if filereadable(expand("~/.vim/autoload/pathogen.vim"))
    runtime! autoload/pathogen.vim
    if exists("g:loaded_pathogen")
       call pathogen#infect()
       call pathogen#helptags()
    endif
endif
"}}}2
"" Preparations{{{2
set nocompatible             " VIM ONLY, NO VI ALLOWED
syntax on                    " Set syntax highlighting
filetype plugin indent on
let mapleader = ","          " Leader for mapping
set shell=/bin/bash
"}}}2
" Mktmpdir recreates dir{{{2
command! Mktmpdir call mkdir(fnamemodify(tempname(),":p:h"),"",0700)
"}}}2
"" Options{{{2
" These are for my sanity when loading modified vimrc in Sessions
set ssop-=options            " DO NOT STORE GLOBAL/LOCAL VARIABLES IN SESSION
set ssop-=folds              " DO NOT STORE FOLDS IN SESSION

set background=light         " Modify syntax highlighting color schemes

set showcmd                  " Show typed commands
set cmdheight=1              " Commandline height of 1 lines

set showmatch                " Show matching pairs of brackets

set ruler                    " Show line number on the bar
set number                   " Show lines on side of screen

set ai                       " Autoindent
set si                       " Smartindent

set cul                      " Highlight current line

set incsearch                " Highlight matched regexps during search entry

set scrolloff=0              " Always keep cursor in center

set vb t_vb=                 " I don't want beeps

" Folding{{{3
" Common key bindings:
" za - toggles folding
" zc - closes a fold
" zo - opens a fold
" zR - opens all folds
" zM - closes all folds
set foldmethod=syntax        " Fold based on syntax files
set foldnestmax=10           " Deepest nesting is 10 levels
"set nofoldenable             " Don't automatically fold
"set foldlevel=1
"}}}3


" Vim recognizes shell alias commands
let $BASH_ENV = "~/.bash_aliases"

" Vim looks for project-specific tags
set tags=./tags,tags;

" Keep style for autoindent
set copyindent               " Copy indent of last line
set preserveindent           " Keep indent at same level

set backspace=2  " Fix backspace behavior in vim
"}}}2
"" GUI Check{{{2
if has("gui_running")
    "echo "Yes, we have a GUI"
    set mouse=a
else
    "echo "Just a boring console"
    set mouse=
endif
"}}}2
"" Set up command expansion for LaTeX{{{2
augroup LaTeXexp
    autocmd!
    autocmd FileType * :exec("setlocal dictionary+=".$HOME."/.vim/dictionaries/".expand('<amatch>'))
augroup END
set completeopt=menuone,longest,preview
set complete+=k
"}}}2
"" Highlights{{{2
hi Comment ctermfg=Cyan
hi Search cterm=NONE ctermfg=black ctermbg=blue
hi Visual cterm=NONE ctermfg=black ctermbg=lightgray
hi Folded cterm=NONE ctermfg=black ctermbg=darkgray
"}}}2
augroup fixcomments
    autocmd!
    au Filetype * set fo-=c fo-=r fo-=o
augroup END
"" Makefile tab handling{{{2
let _curfile = expand("%:t")
if _curfile =~ "Makefile" || _curfile =~ "makefile" || _curfile =~ ".*\.mk"
    set noexpandtab              " We want proper tabs in makefiles!
else                             " but if it isn't a makefile...
    set expandtab                " turn tabs into spaces
    set tabstop=4 shiftwidth=4   " tab length is 4
endif
"}}}2

"}}}1
"REMAPPINGS{{{1

" Retab automatically reconfigures tabs to spaces{{{2
noremap <silent> <F2> :retab <CR>
"}}}2
" Remap command starter to save button presses{{{2
"""""" THIS IS MY SECOND FAVORITE MAPPING IN THE UNIVERSE
nore ; :
"}}}2
" Set search mapping so that next found in search centers on line{{{2
noremap N Nzz
noremap n nzz
"}}}2
" Open tag definition in a new tab with ctrl+\{{{2
noremap <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"}}}2
" Insert a single character{{{2
nnoremap <Space> i_<C-C>r
"}}}2
" Insert a single character into a block selection{{{2
" OR: Replace an entire selection with a single selection
vnoremap <Space> I_<ESC>gvr
"}}}2
" Escape with jk{{{2
"""""" THIS IS MY FAVORITE MAPPING IN THE UNIVERSE
inoremap jk <ESC>
inoremap JK <ESC>
inoremap jK <ESC>
inoremap Jk <ESC>

"inoremap kj <ESC>
"inoremap Kj <ESC>
"inoremap kJ <ESC>
"inoremap KJ <ESC>
"}}}2
" Fix <M-]> behavior{{{2
set <M-]>=^[]
"}}}2
" Open tag definition in vertical split with alt+]{{{2
noremap <M-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
"}}}2
" Arrow Key Mapping{{{2
""""" A TOOL FOR LEARNING 'THE VIM WAY'
""""" USE MAPPING TO DISABLE ARROW KEYS!{{{3
"noremap <up> <nop>
"noremap <down> <nop>
"noremap <left> <nop>
"noremap <right> <nop>

"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
"}}}3
""""" USE THIS AFTER TRAINING YOURSELF OUT OF ARROW KEYS{{{3
" Left and right arrow keys are for moving tabs...
nnoremap <silent> <left> :tabp<CR>
nnoremap <silent> <right> :tabn<CR>
inoremap <silent> <ESC>[D <C-C>:tabp<CR>
inoremap <silent> <ESC>[C <C-C>:tabn<CR>
vnoremap <silent> <left> :tabp<CR>
vnoremap <silent> <right> :tabn<CR>


" Up and down arrow keys are for moving buffers
nnoremap <silent> <up> :bp<CR>
nnoremap <silent> <down> :bn<CR>
inoremap <silent> <ESC>[A <C-C>:bp<CR>
inoremap <silent> <ESC>[B <C-C>:bn<CR>
vnoremap <silent> <left> :bp<CR>
vnoremap <silent> <right> :bn<CR>


" Alternatively, use arrow keys for moving about windows
" It's really up to you how you use them!
nnoremap <silent> <leader><left>  <C-W>h
nnoremap <silent> <leader><right> <C-W>l
nnoremap <silent> <leader><up>    <C-W>j
nnoremap <silent> <leader><down>  <C-W>k
"}}}3
"}}}2
""""""" THIS MAPPING DISABLES ESC IN INSERT MODE{{{2
" 'If Escape is your friend, why is it so far away from you?'
inoremap <ESC> <nop>
"}}}2
" vimrc commands{{{2
" _s_ource my _v_imrc file{{{3
nnoremap <silent> <leader>sv :call functions#RefreshVim()<CR>
"}}}3

" _e_dit my _v_imrc file in a new window split{{{3
nnoremap <silent> <leader>ev :vsp $MYVIMRC <CR>
"}}}3
"}}}2
" Surround a word in quotes in normal mode{{{2
nnoremap <silent> <leader>" viW<ESC>a"<ESC>hbi"<ESC>lel
"}}}2
" Surround a word in quotes in visual mode{{{2
"vnoremap <leader>" i`<
"}}}2
" Toggle spellcheck on/off{{{2
nnoremap <silent> <leader>ss :set spell!<CR>
"}}}2
" Save current session{{{2
nnoremap <silent> <leader>ses :mkses!<CR>
"}}}2
" Make{{{2
nnoremap <silent> <leader>m :make<CR>
"}}}2
" Switch windows quickly, no control required{{{2
nnoremap <silent> <leader>w <C-W>
"}}}2
" Suggestions pop up{{{2
inoremap <silent> <leader><leader> <C-P>
"}}}2
" Center cursor automagically{{{2
nnoremap <silent> <leader>cc  :call functions#CenterToggle()<CR>
"}}}2
" ffffuuuuuu{{{2
nnoremap <leader>fuuuuu qqqqqifuu<Esc>h@qq@q
"}}}2
" Insta-open explorer to show adjacent files{{{2
" This provides seamless browsing of complex directory structures,
" as the same button moves up one directory!
nnoremap - :Explore<CR>
"}}}2
" Remove highlight after search{{{2
nnoremap <silent> <leader>h :noh<CR>
"}}}2
" Operator for 'inside next parantheses'{{{2
onoremap in( :<C-U>normal! f(vi(<CR>
"}}}2
" Operator for 'inside last parentheses'{{{2
onoremap il( :<C-U>normal! F)vi(<CR>
"}}}2
" Operator for 'around next parentheses'{{{2
" onoremap an( :<C-U>normal! f(vib<CR>
"}}}2
" Operator for 'around last parentheses'{{{2
" onoremap al( :<C-U>normal! F)viW<CR>
"}}}2

"}}}1
"ABBREVIATIONS{{{1

" Email abbrevation{{{2
iabbrev @@     bam9523@rit.edu
"}}}2
" Name abbreviation{{{2
iabbrev mname  Brian Alexander Mejorado
"}}}2

"}}}1
"PLUGINS{{{1

" LatexBox{{{2
" TODO This is computer-dependent; make this portable!
let g:LatexBox_latexmk_options = "-pvc -pdf -output-directory=build"
let g:LatexBox_viewer = "C:\Program Files (x86)\Adobe\Reader 11.0\Reader\AcroRd32.exe"
let g:LatexBox_Folding = 1  " LatexBox has folding, use it.
"}}}2
" Tagbar{{{2
" Quickstart Tagbar
nnoremap <silent> <F8> :TagbarToggle<CR>

" Quickstart Tagbar in autoclose mode
nnoremap <silent> <leader>tt :TagbarOpenAutoClose<CR>

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
"}}}2
" Eclim{{{2
let g:EclimCompletionMethod = 'omnifunc'
let g:EclimTodoSearchPattern = '\(\<fixme\>\|\<todo\>\|\<xxx\>\)\c'
let g:EclimProjectTreeAutoOpen = 1
let g:eclimProjectTreeExpandPathOnOpen = 1


" Define some mappings
augroup enter_eclim "{{{3
    autocmd!
    au VimEnter * try | call functions#EnterEclim() | catch /.*/ | echom "No Eclim installation." | endtry
augroup END
"}}}3
"}}}2
" Supertab{{{2
if has("autocmd") && exists("+omnifunc") " prepare omnifunc
autocmd Filetype *
        \   if &omnifunc == "" |
        \       setlocal omnifunc=syntaxcomplete#Complete |
        \   endif
endif

" Disable preview window
set completeopt-=preview

" Use context for completion
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCompletionContexts = ['s:ContextText']
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
"}}}2
" MBE{{{2
augroup mbe
    au VimEnter * MBEOpen
augroup END

nnoremap <leader>mt :MBEToggle<CR>
"}}}2

"}}}1
"EXTERNAL{{{1

"runtime MoshTab.vim          " Adds smart tab autocomplete
runtime CPrototypes.vim      " Prototype generation for C headers
runtime BuildStatusline.vim  " Load up custom statusline

" TODO Create a function for C-style languages :NewFunct
" usage will be :NewFunct [name] [returntype] [param1] [param2] ...
" In Java, will be :NewFunct [name] [returntype] [visibility] [params] ...
" Automatically produces docs and prototype
"}}}1

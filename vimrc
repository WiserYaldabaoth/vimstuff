"vim:setlocal fen fdm=marker

"SETTINGS{{{1

" Source local vimrc before ANYTHING{{{2
let s:host_vimrc = $HOME . '/.' . hostname() . '.vimrc'
if filereadable(s:host_vimrc)
    execute 'source ' . s:host_vimrc
endif
"}}}2
"""" Vim-Plug{{{2

call plug#begin('~/.vim/plugged') "{{{3

Plug 'lervag/vimtex'

Plug 'morhetz/gruvbox'
" Plug 'fholgado/minibufexpl'
Plug 'ervandew/supertab'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'
Plug 'qpkorr/vim-bufkill'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'plasticboy/vim-markdown'
Plug 'idanarye/vim-merginal'
Plug 'dsummersl/vimunit'

" Eclim
Plug '~/.vim/bundle/eclim'

call plug#end() "}}}3

"}}}2
"""" Options{{{2
" For my sanity when loading modified vimrc in Sessions{{{3
set ssop-=options            " DO NOT STORE GLOBAL/LOCAL VARIABLES IN SESSION
set ssop-=folds              " DO NOT STORE FOLDS IN SESSION
"}}}3
" Background display{{{3
set background=light         " Modify syntax highlighting color schemes
"}}}3
" Modify commandline{{{3
set showcmd                  " Show typed commands
set cmdheight=1              " Commandline height of 1 lines
"}}}3
" Bracket matching{{{3
set showmatch                " Show matching pairs of brackets
"}}}3
" Numbering{{{3
set ruler                    " Show line number on the bar
set number                   " Show lines on side of screen
"}}}3
" Indenting{{{3
set ai                       " Autoindent
set si                       " Smartindent
set copyindent               " Copy indent of last line
set preserveindent           " Keep indent at same level
"}}}3
" Highlighting{{{3
set cul                      " Highlight current line
set incsearch                " Highlight matched regexps during search entry
"}}}3
" Configure scrolloff{{{3
set scrolloff=0              " Don't keep cursor in center
"}}}3
" Disable beeps{{{3
set vb t_vb=
"}}}3
" Folding{{{3
" Common key bindings:
" za - toggles folding
" zc - closes a fold
" zo - opens a fold
" zR - opens all folds
" zM - closes all folds
"set foldmethod=syntax        " Fold based on syntax files
set foldnestmax=10           " Deepest nesting is 10 levels
"set nofoldenable             " Don't automatically fold
"set foldlevel=1
"}}}3
" Recognize shell alias commands{{{3
let $BASH_ENV = "~/.bash_aliases"
"}}}3
" Look for project-specific tags{{{3
set tags=./tags,tags;
"}}}3
" Fix backspace behavior{{{3
set backspace=2  " Fix backspace behavior in vim
"}}}3
"}}}2
" Preparations{{{2
set nocompatible             " VIM ONLY, NO VI ALLOWED
syntax on                    " Set syntax highlighting
filetype plugin indent on
let mapleader = ","          " Leader for mapping
set shell=/bin/bash
"}}}2
" Mktmpdir recreates dir{{{2
command! Mktmpdir call mkdir(fnamemodify(tempname(),":p:h"),"",0700)
"}}}2
" GUI Check{{{2
if has("gui_running")
    "echo "Yes, we have a GUI"
    set mouse=a
else
    "echo "Just a boring console"
    set mouse=
endif
"}}}2
" Set up command expansion for LaTeX{{{2
augroup LaTeXexp "{{{3
    autocmd!
    autocmd FileType * :exec("setlocal dictionary+=".$HOME."/.vim/dictionaries/".expand('<amatch>'))
augroup END
"}}}3
set completeopt=menuone,longest,preview
set complete+=k
"}}}2
augroup fixcomments "{{{2
    autocmd!
    au Filetype <buffer> set fo-=c fo-=r fo-=o
augroup END
"}}}2
" Makefile tab handling{{{2
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

"""" Arrow Key Mapping{{{2
""""""" USE MAPPING TO DISABLE ARROW KEYS!{{{3
""""""" A TOOL FOR LEARNING 'THE VIM WAY'
"noremap <up> <nop>
"noremap <down> <nop>
"noremap <left> <nop>
"noremap <right> <nop>

"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
"}}}3
""""""" USE THIS AFTER TRAINING YOURSELF OUT OF ARROW KEYS{{{3
" A:<[direction]>      Left and right arrow keys for moving tabs{{{4
nnoremap <silent> <left> :tabp<CR>
nnoremap <silent> <right> :tabn<CR>
inoremap <silent> <ESC>[D <C-C>:tabp<CR>
inoremap <silent> <ESC>[C <C-C>:tabn<CR>
vnoremap <silent> <left> :tabp<CR>
vnoremap <silent> <right> :tabn<CR>
"}}}4
" A:<[direction]>      Up and down arrow keys for moving buffers{{{4
nnoremap <silent> <up> :bp<CR>
nnoremap <silent> <down> :bn<CR>
inoremap <silent> <ESC>[A <C-C>:bp<CR>
inoremap <silent> <ESC>[B <C-C>:bn<CR>
vnoremap <silent> <left> :bp<CR>
vnoremap <silent> <right> :bn<CR>
"}}}4
" N:<leader><[direction]>  Use arrow keys to move windows{{{4
" It's really up to you how you use them!
nnoremap <silent> <leader><left>  <C-W>h
nnoremap <silent> <leader><right> <C-W>l
nnoremap <silent> <leader><up>    <C-W>j
nnoremap <silent> <leader><down>  <C-W>k
"}}}4
"}}}3
"}}}2
"""" vimrc commands{{{2
" N:<leader>sv  _s_ource my _v_imrc file{{{3
nnoremap <silent> <leader>sv :call functions#RefreshVim()<CR>
"}}}3
" N:<leader>ev  _e_dit my _v_imrc file in a new window split{{{3
nnoremap <silent> <leader>ev :vsp $MYVIMRC <CR>
"}}}3
"}}}2
" N:<F2>      Retab automatically reconfigures tabs to spaces{{{2
noremap <silent> <F2> :retab <CR>
"}}}2
" N:;         Remap command starter to save button presses{{{2
"""""" THIS IS MY SECOND FAVORITE MAPPING IN THE UNIVERSE
nore ; :
"}}}2
" N::         Remap semicolon for repeat f,F,t,T{{{2
nore : ;
"}}}2
" N:N   n     Next found in search centers on line{{{2
noremap N Nzz
noremap n nzz
"}}}2
" N:<C-\>     Open tag definition in a new tab with ctrl+\{{{2
noremap <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"}}}2
" N:<Space>   Insert a single character{{{2
nnoremap <Space> i_<C-C>r
"}}}2
" N:<Space>   Insert a single character into a block selection{{{2
" OR: Replace an entire selection with a single selection
vnoremap <Space> I_<ESC>gvr
"}}}2
" I:jk        Escape with jk{{{2
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
" N:gb        Quickly navigate through buffers{{{2
nnoremap gb :ls<cr>:b<space>
"}}}2
" N:<M-]>     Open tag definition in vertical split with alt+]{{{2
" Fix <M-[> behavior first
set <M-]>=^[]
noremap <M-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
"}}}2
" I:<Esc>     DISABLE ESC IN INSERT MODE{{{2
" 'If Escape is your friend, why is it so far away from you?'
inoremap <ESC> <nop>
"}}}2
" N:<leader>"    Surround word in quotes{{{2
nnoremap <silent> <leader>" viW<ESC>a"<ESC>hbi"<ESC>lel
"}}}2
" V:<leader>"    Surround a word in quotes in visual mode{{{2
"vnoremap <leader>" i`<
"}}}2
" N:<leader>ss   Toggle spellcheck on/off{{{2
nnoremap <silent> <leader>ss :set spell!<CR>
"}}}2
" N:<leader>ses  Save current session{{{2
nnoremap <silent> <leader>ses :mkses!<CR>
"}}}2
" N:<localleader>m    Make{{{2
nnoremap <silent> <localleader>m :make<CR>
"}}}2
" N:<leader>w    Switch windows quickly{{{2
nnoremap <silent> <leader>w <C-W>
"}}}2
" I:<leader><leader>    Suggestions pop up{{{2
inoremap <silent> <leader><leader> <C-P>
"}}}2
" N:<leader>cc   Center cursor automagically{{{2
nnoremap <silent> <leader>cc  :call functions#CenterToggle()<CR>
"}}}2
" N:<leader>ffffuuuuuu{{{2
nnoremap <leader>fuuuuu qqqqqifuu<Esc>h@qq@q
"}}}2
" N:-         Insta-open explorer to show adjacent files{{{2
" This provides seamless browsing of complex directory structures,
" as the same button moves up one directory!
nnoremap - :Explore<CR>
"}}}2
" N:<leader>h     Remove highlight after search{{{2
nnoremap <silent> <leader>h :noh<CR>
"}}}2
" O:in(       'Inside next parantheses'{{{2
onoremap in( :<C-U>normal! f(vi(<CR>
"}}}2
" O:il(       'Inside last parentheses'{{{2
onoremap il( :<C-U>normal! F)vi(<CR>
"}}}2
" O:an(       'Around next parentheses'{{{2
" onoremap an( :<C-U>normal! f(vib<CR>
"}}}2
" O:al(       'Around last parentheses'{{{2
" onoremap al( :<C-U>normal! F)viW<CR>
"}}}2

"}}}1
"ABBREVIATIONS{{{1

" I:@@        Email abbrevation{{{2
iabbrev @@     bam9523@rit.edu
"}}}2
" I:mname     Name abbreviation{{{2
iabbrev mname  Brian Alexander Mejorado
"}}}2

"}}}1
"PLUGINS{{{1

" Vimtex{{{2
let g:LatexBox_latexmk_options = "-pvc -pdf -output-directory=build"
let g:vimtex_fold_enabled = 1
"}}}2
" Fugitive{{{2
" Fugitive Mappings{{{3
" if(exists('g:loaded_fugitive') && g:loaded_fugitive ==# 1)
    " N:<leader>gs    git status{{{4
    nnoremap <silent> <leader>gs :Gstatus<CR>
    "}}}4
    " N:<leader>gd    git diff{{{4
    nnoremap <silent> <leader>gd :Gdiff<CR>
    "}}}4
    " N:<leader>gc    git commit{{{4
    nnoremap <silent> <leader>gc :Gcommit<CR>
    "}}}4
    " N:<leader>gb    git blame{{{4
    nnoremap <silent> <leader>gb :Gblame<CR>
    "}}}4
    " N:<leader>gl    git log{{{4
    nnoremap <silent> <leader>gl :Glog<CR>
    "}}}4
    " N:<leader>gp    git push{{{4
    nnoremap <silent> <leader>gp :Git push<CR>
    "}}}4
    " N:<leader>gr    git read{{{4
    nnoremap <silent> <leader>gr :Gread<CR>
    "}}}4
    " N:<leader>gw    git write{{{4
    nnoremap <silent> <leader>gw :Gwrite<CR>
    "}}}4
    " N:<leader>ge    git edit{{{4
    nnoremap <silent> <leader>ge :Gedit<CR>
    "}}}4
    " N:<leader>ga    git add %:p{{{4
    nnoremap <silent> <leader>ga :Git add %:p<CR>
    "}}}4
    " N:<leader>gfl   git fl{{{4
    nnoremap <silent> <leader>gfl :Git fl<CR>
    "}}}4
" endif
"}}}3
"}}}2
" Merginal{{{2
" Merginal Mappings{{{3
" N:<leader>me    Open merginal{{{4
nnoremap <silent> <leader>me :Merginal<CR>
"}}}4
"}}}3
"}}}2
" Tagbar{{{2
" Tagbar Mappings{{{3
" if(exists('g:loaded_tagbar') && g:loaded_tagbar ==# 1)
    " N:<F8>          Quickstart Tagbar{{{4
    nnoremap <silent> <F8> :TagbarToggle<CR>
    "}}}4
    " N:<leader>tt    Quickstart Tagbar in autoclose mode{{{4
    nnoremap <silent> <leader>tt :TagbarOpenAutoClose<CR>
    "}}}4
" endif
"}}}3
" Prepare Tagbar for TeX.{{{3
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
"}}}3
"}}}2
" Eclim{{{2
let g:EclimCompletionMethod = 'omnifunc'
let g:EclimTodoSearchPattern = '\(\<fixme\>\|\<todo\>\|\<xxx\>\)\c'
"let g:EclimProjectTreeAutoOpen = 1
let g:eclimProjectTreeExpandPathOnOpen = 1

" Define some mappings
augroup enter_eclim
    autocmd!
    au VimEnter * try | call functions#EnterEclim() | catch /.*/ | echom "No Eclim installation." | endtry
augroup END
"}}}2
" Supertab{{{2
" Set up omnifunc                                                         {{{3
if has("autocmd") && exists("+omnifunc") " prepare omnifunc
autocmd Filetype *
        \   if &omnifunc == "" |
        \       setlocal omnifunc=syntaxcomplete#Complete |
        \   endif
endif
"}}}3
" Disable preview window{{{3
set completeopt-=preview
"}}}3
" Use context for completion{{{3
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCompletionContexts = ['s:ContextText']
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
"}}}3
"}}}2
" MBE{{{2
"augroup open_mbe
    "au VimEnter * MBEOpen
"augroup END
" N:<leader>mt    Toggle MBE{{{3
"nnoremap <leader>mt :MBEToggle<CR>
"}}}3
"}}}2

"}}}1
"EXTERNAL{{{1

runtime CPrototypes.vim      " Prototype generation for C headers
runtime BuildStatusline.vim  " Load up custom statusline
runtime ModeAwareCursor.vim
" runtime LoadColorScheme.vim

"}}}1
" AFTER{{{1

" Set colorscheme{{{2
colorscheme gruvbox
set bg=dark
"}}}2

" Highlights{{{2
if(!exists('g:colors_name'))
    hi Comment ctermfg=Cyan
    hi Search cterm=NONE ctermfg=black ctermbg=blue
    hi Visual cterm=NONE ctermfg=black ctermbg=130
    hi Folded cterm=NONE ctermfg=93 ctermbg=black

     augroup cursorlinehi"{{{3
         autocmd!
         au ColorScheme default au InsertEnter * hi CursorLine ctermbg=17
         au ColorScheme default au InsertLeave * hi CursorLine ctermbg=black
     augroup END
    "}}}3
elseif(g:colors_name ==# 'gruvbox' && &bg ==# 'dark')
    augroup cursorlinehigruv
        autocmd!
        au InsertEnter * hi CursorLine ctermbg=17
        au InsertLeave * hi CursorLine ctermbg=237
    augroup END
endif
"}}}2
"
"}}}1
" NOTES {{{1
" TODO Create a function for C-style languages :NewFunct
" usage will be :NewFunct [name] [returntype] [param1] [param2] ...
" In Java, will be :NewFunct [name] [returntype] [visibility] [params] ...
" Automatically produces docs and prototype

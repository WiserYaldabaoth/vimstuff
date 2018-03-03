" vim: fen:fdm=marker:

" SOURCE LOCAL VIMRC {{{1
let s:host_vimrc = $HOME . '/.' . hostname() . '.vimrc'
if filereadable(s:host_vimrc)
    execute 'source ' . s:host_vimrc
endif
"}}}1
" PLUGINS {{{1
call plug#begin('~/.vim/plugged')

" 1: Must-have {{{2
" Plugins I rely on for everyday usage.
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'
Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-entire'
Plug 'romainl/vim-qf'
Plug 'morhetz/gruvbox'
"}}}2

" 2: Nice-to-have {{{2
" Cool plugins I don't *need*, but do things I like.
Plug 'tpope/vim-vinegar'
Plug 'mbbill/undotree'
Plug 'ervandew/supertab'
Plug 'majutsushi/tagbar'
Plug 'justinmk/vim-sneak'
Plug 'jpalardy/vim-slime'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
"}}}2

" 3: Fluff {{{2
" Neat plugins that I could easily do without.
Plug 'luochen1990/rainbow'
Plug 'bling/vim-bufferline'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-eunuch'
Plug 'neilagabriel/vim-geeknote'
Plug 'ervandew/supertab'
" Autocomplete and snippets {{{3
if version > 703
    Plug 'sirver/ultisnips'
                \ | Plug 'honza/vim-snippets'
else
    Plug 'MarcWeber/vim-addon-mw-utils'
                \ | Plug 'tomtom/tlib_vim'
                \ | Plug 'garbas/vim-snipmate'
                \ | Plug 'honza/vim-snippets'
endif
"}}}3
" Writing-related {{{3
Plug 'drougas/vim-pythesaurus'
Plug 'reedes/vim-wordy', { 'on': 'Wordy' }
Plug 'reedes/vim-lexical'
Plug 'reedes/vim-pencil', { 'on': [ 'Pencil', 'PencilToggle' ] }
Plug 'junegunn/goyo.vim' | Plug 'amix/vim-zenroom2', { 'on': 'Goyo' }
" }}}3
" Colorschemes {{{3
Plug 'romainl/flattened' " Solarized
Plug 'romainl/Apprentice'
Plug 'ipsod/nes.vim'
Plug 'freeo/vim-kalisi'
Plug 'Lokaltog/vim-distinguished'
Plug 'rking/vim-detailed'
Plug 'sjl/badwolf'
Plug 'chriskempson/base16-vim'
Plug 'reedes/vim-colors-pencil'
Plug 'whatyouhide/vim-gotham'
Plug 'trapd00r/neverland-vim-theme'
Plug 'endel/vim-github-colorscheme'
Plug 'joshdick/onedark.vim'
"}}}3
"}}}2

" tools: Tool-specific {{{2
" Plugins to make working with certain tools or languages easier.
Plug 'adimit/prolog.vim', { 'for': 'prolog' }
Plug 'othree/xml.vim', { 'for': 'xml' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mzlogin/vim-markdown-toc', { 'for': 'markdown' }
Plug 'junegunn/vader.vim', { 'on': 'Vader', 'for': 'vader' }
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-ragtag', { 'for': [ 'eruby', 'xml', 'html', 'xhtml' ] }
Plug '~/git/vim-decompile'
" LaTeX {{{3
Plug 'lervag/vimtex'
Plug 'glts/vim-texlog'
Plug 'rbonvall/vim-textobj-latex', { 'for': [ 'tex', 'plaintex', 'latex', 'dtx' ] }
"}}}3
" Git {{{3
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rhubarb'
Plug 'idanarye/vim-merginal'
Plug 'gregsexton/gitv'
"}}}3
"}}}2

" none: Pointless {{{2
" Graveyard of plugins I used to use until I learned more about vim.
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
"         \ | Plug 'junegunn/fzf.vim'
" Plug 'rking/ag.vim' | Plug 'Chun-Yang/vim-action-ag'
" Plug 'vim-airline/vim-airline'
"             \ | Plug 'vim-airline/vim-airline-themes'
"             \ | Plug 'reedes/vim-thematic'
"}}}2

call plug#end()
"}}}1
"SETTINGS{{{1

" For my sanity when loading modified vimrc in Sessions{{{2
set ssop-=options            " DO NOT STORE GLOBAL/LOCAL VARIABLES IN SESSION
set ssop-=folds              " DO NOT STORE FOLDS IN SESSION
"}}}2
" Modify commandline{{{2
set showcmd                  " Show typed commands
set cmdheight=1              " Commandline height of 1 lines
"}}}2
" Bracket matching{{{2
set showmatch                " Show matching pairs of brackets
"}}}2
" Numbering{{{2
set ruler                    " Show line number on the bar
set number                   " Show lines on side of screen
if v:version > 703
    set relativenumber           " Numbers relative to cursorline
endif
"}}}2
" Indenting{{{2
set ai                       " Autoindent
" set si                       " Smartindent
set copyindent               " Copy indent of last line
set preserveindent           " Keep indent at same level
set listchars=eol:$,trail:#,tab:→_
"}}}2
" Highlighting{{{2
set cul                      " Highlight current line
set incsearch                " Highlight matched regexps during search entry
"}}}2
" Configure scrolloff{{{2
set scrolloff=0              " Don't keep cursor in center
"}}}2
" Disable beeps{{{2
set vb t_vb=
"}}}2
" Folding{{{2
" Common key bindings:
" za - toggles folding
" zc - closes a fold
" zo - opens a fold
" zR - opens all folds
" zM - closes all folds
" zv - open a fold to cursor
"set foldmethod=syntax        " Fold based on syntax files
set foldnestmax=10           " Deepest nesting is 10 levels
set nofoldenable             " Don't automatically fold
"set foldlevel=1
"}}}2
" Recognize shell alias commands{{{2
let $BASH_ENV = "~/.bash_aliases"
let $ZSH_ENV = "~/.zshenv"
"}}}2
" Look for project-specific tags{{{2
set tags=./tags,tags;
"}}}2
" Fix backspace behavior{{{2
set backspace=2  " Fix backspace behavior in vim
"}}}2
" List EOL chars as an unsightly X {{{2
set listchars+=trail:X
"}}}2
" Enable recursive directory search {{{2
" Eliminates the need for fuzzy-finding!
set path+=**
"}}}2
" Display tab choices {{{2
set wildmenu " you make my heart a venue????
"}}}2
" ag for grep {{{2
" Invalidates need for Ag.vim
set grepprg="ag --vimgrep -n $* /dev/null"
"}}}2
" Preparations{{{2
let mapleader = ","          " Leader for mapping
set shell=zsh
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
" Make vim behave with tmux!{{{2
set t_ut=
"}}}2
" Disable modifying read-only files{{{2
function! s:UpdateModifiable()
  if !exists("b:setmodifiable")
    let b:setmodifiable = 0
  endif
  if &readonly
    if &modifiable
      setlocal nomodifiable
      let b:setmodifiable = 1
    endif
  else
    if b:setmodifiable
      setlocal modifiable
    endif
  endif
endfunction
"
augroup update_modifiable
    autocmd!
    autocmd BufReadPost * call <SID>UpdateModifiable()
augroup END
"}}}2
" Make XML editing easier{{{2
let g:xml_syntax_folding=1
"}}}2
" Fix <M-[> behavior first {{{2
set <M-]>=^[]
"}}}2

"}}}1
"REMAPPINGS{{{1

" N:<F2>      Retab automatically reconfigures tabs to spaces{{{2
noremap <silent> <F2> :retab <CR>
"}}}2
" N:-         Insta-open explorer to show adjacent files{{{2
" This provides seamless browsing of complex directory structures,
" as the same button moves up one directory!
nnoremap - :Explore<CR>
"}}}2
" N:;         Remap command starter to save button presses{{{2
nore ; :
"}}}2
" N::         Remap semicolon for repeat f,F,t,T{{{2
nore : ;
"}}}2
" N:N   n     Next found in search centers on line{{{2
" zz centers, zv opens folds to required depth
noremap N Nzzzv
noremap n nzzzv
"}}}2
" N:Y         Copy until end of line; aligns with C, A, and D{{{2
nore Y y$
"}}}2
" N:<C-W>a    Open tag definition in a new tab with <C-W>a {{{2
" No good mneumonic but not many available <C-W> mappings
noremap <C-W>a :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"}}}2
" N:<Space>   Insert a single character{{{2
nnoremap <Space> i_<C-C>r
"}}}2
" V:<Space>   Insert a single character into a block selection{{{2
" OR: Replace an entire selection with a single selection
vnoremap <Space> I_<ESC>gvr
"}}}2
" I:jk        Escape with jk{{{2
inoremap jk <ESC>
inoremap JK <ESC>
inoremap jK <ESC>
inoremap Jk <ESC>
"
" We can dance if we want to
"inoremap kj <ESC>
"inoremap Kj <ESC>
"inoremap kJ <ESC>
"inoremap KJ <ESC>
"}}}2
" I:j;w       Save if I mess up{{{2
"  It's embarrassing how many times this happens
inoremap j;w <ESC>:w<CR>
"}}}2
" N:gb        Quickly navigate through buffers{{{2
nnoremap gb :ls<cr>:b<space>
"}}}2
" N:zp        Fix the next misspelled word and return{{{2
nnoremap <silent> zp ]s1z=
"}}}2
" N:zq        Fix the previous misspelled word and return{{{2
nnoremap <silent> zq [s1z=
"}}}2
" N:<C-W>e    Open tag definition in vertical split with <C-W>e{{{2
noremap <C-W>a :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
"}}}2
" N:<leader>sv   _s_ource my _v_imrc file{{{2
nnoremap <silent> <leader>sv :call functions#RefreshVim()<CR>
"}}}2
" N:<leader>ev   _e_dit my _v_imrc file in a new tab {{{2
nnoremap <silent> <leader>ev :tabnew $MYVIMRC <CR>
"}}}2
" N:<leader>ss   Replace end-of-line whitespace {{{2
nnoremap <silent> <leader>ss :%s/\s\+$<CR>
"}}}2
" N:<leader>w    Switch windows quickly{{{2
nnoremap <silent> <leader>w <C-W>
"}}}2
" N:<leader>cc   Center cursor automagically{{{2
nnoremap <silent> <leader>cc  :call functions#CenterToggle()<CR>
"}}}2
" N:<leader>/    Clear the search register {{{2
nnoremap <silent> <leader>/ :let @/=''<CR>
"}}}2
" N:<leader>r    Redraw! The screen! Now! Do it! {{{2
nnoremap <silent> <leader>r :redraw!<CR>
"}}}2
" N:<leader>ffffuuuuuu{{{2
nnoremap <leader>fuuuuu qqqqqifuu<Esc>h@qq@q
"}}}2
" N:<localleader>m    Make{{{2
nnoremap <silent> <localleader>m :make<CR>
"}}}2
" N:gz    Go zazzlegrep! {{{2
" TODO: Maybe expand this functionality into a plugin?
" I could see using it like gzw for 'go zazzlegrep a word'
" or Vgz for 'go zazzlegrep selected line'
nnoremap <silent> gz q:ilv // %<ESC>F/i
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
" PLUGIN SETTINGS {{{1

" netrw {{{2
" Assuming it still counts as a plugin, anyways...
let g:netrw_browser_viewer = 'lynx'
let g:netrw_liststyle = 3  " tree view for netrw
let g:netrw_banner = 0 " disable annoying banner
" }}}2
" Polyglot {{{2
let g:polyglot_disabled = ['latex']
"}}}2
" Vimtex{{{2
let g:vimtex_latexmk_options = "-pvc -pdf -outdir=build -interaction=nonstopmode --shell-escape -bibtex"
let g:vimtex_fold_enabled = 1
let g:vimtex_fold_comments = 1
let g:vimtex_view_general_viewer = "evince"
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
    " N:<leader>glo   git log{{{4
    nnoremap <silent> <leader>glo :Glog<CR>
    "}}}4
    " N:<leader>glc   git lcd{{{4
    nnoremap <silent> <leader>glc :Glcd<CR>
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
    \ 'ctagstype' : 'tex',
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
" Supertab {{{2
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
" Themes {{{2

if has( 'unix' )
    let g:thematic#defaults = {
\       'typeface': 'Inconsolata',
\       'font-size': 11,
\       'background': 'dark',
\       'laststatus': 2,
\ }
elseif has ('win32unix')
    let g:thematic#defaults = {
\       'typeface': 'Deja Vu Sans Mono',
\       'font-size': 10,
\       'background': 'dark',
\       'laststatus': 2,
\ }
endif

let g:thematic#themes = {
\ 'gruvbox' : { 'colorscheme': 'gruvbox',
\               'background': 'dark',
\               'airline-theme': 'gruvbox',
\             },
\ 'inkpot' : { 'colorscheme': 'inkpot',
\              'airline-theme': 'jellybeans',
\              'fold-column-color-mute': 1,
\            },
\ 'solarized' : { 'colorscheme': 'solarized',
\                 'background': 'dark',
\                 'airline-theme': 'solarized',
\               },
\ 'eclipse' : { 'colorscheme': 'eclipse',
\               'background': 'light',
\               'airline-theme': 'light',
\               'sign-color-column-fix': 1,
\               'diff-color-fix': 0,
\             },
\ 'github' : { 'colorscheme': 'github',
\              'background': 'light',
\              'airline-theme': 'zenburn',
\            },
\ 'greenscreen': { 'colorscheme': 'base16-greenscreen',
\                  'background': 'dark',
\                  'airline-theme': 'base16_greenscreen',
\                },
\ 'distinguished': { 'colorscheme': 'distinguished',
\                    'background': 'dark',
\                    'airline-theme': 'distinguished',
\                  },
\ 'apprentice': { 'colorscheme': 'apprentice',
\                 'background': 'dark',
\                 'airline-theme': 'apprentice',
\               },
\ 'gotham': { 'colorscheme': 'gotham256',
\             'background': 'dark',
\             'airline-theme': 'gotham256',
\            },
\ 'detailed': { 'colorscheme': 'detailed',
\               'airline-theme': 'dark',
\             },
\ 'atom': { 'colorscheme': 'onedark',
\           'airline-theme': 'onedark',
\         },
\ }

let g:thematic#theme_name = 'gruvbox'

" }}}2
" UndoTree {{{2
nnoremap <silent> <leader>uu :UndotreeToggle<CR>
" }}}2
" Promptline {{{2
" sections (a, b, c, x, y, z, warn) are optional
if( exists( 'g:loaded_promptline' ) )
    let g:promptline_preset = {
            \'a' : [ promptline#slices#host() ],
            \'b' : [ promptline#slices#user() ],
            \'c' : [ promptline#slices#cwd() ],
            \'y' : [ promptline#slices#vcs_branch() ],
            \'z' : [ promptline#slices#git_status() ],
            \'warn' : [ promptline#slices#last_exit_code() ]}

    " available slices:
    "
    " promptline#slices#cwd() - current dir, truncated to 3 dirs. To configure: promptline#slices#cwd({ 'dir_limit': 4 })
    " promptline#slices#vcs_branch() - branch name only. By default, only git branch is enabled. Use promptline#slices#vcs_branch({ 'hg': 1, 'svn': 1, 'fossil': 1}) to enable check for svn, mercurial and fossil branches. Note that always checking if inside a branch slows down the prompt
    " promptline#slices#last_exit_code() - display exit code of last command if not zero
    " promptline#slices#jobs() - display number of shell jobs if more than zero
    " promptline#slices#battery() - display battery percentage (on OSX and linux) only if below 10%. Configure the threshold with promptline#slices#battery({ 'threshold': 25 })
    " promptline#slices#host() - current hostname.  To hide the hostname unless connected via SSH, use promptline#slices#host({ 'only_if_ssh': 1 })
    " promptline#slices#user()
    " promptline#slices#python_virtualenv() - display which virtual env is active (empty is none)
    " promptline#slices#git_status() - count of commits ahead/behind upstream, count of modified/added/unmerged files, symbol for clean branch and symbol for existing untraced files
    "
    " any command can be used in a slice, for example to print the output of whoami in section 'b':
    "       \'b' : [ '$(whoami)'],
    "
    " more than one slice can be placed in a section, e.g. print both host and user in section 'a':
    "       \'a': [ promptline#slices#host(), promptline#slices#user() ],
    "
    " to disable powerline symbols
    let g:promptline_powerline_symbols = 0
endif
"}}}2
" Gitgutter {{{2
" N:<leader>gg   Toggle GitGutter {{{3
nnoremap <silent> <leader>gg :GitGutterToggle<CR>
"}}}3
" N:<leader>gu   Update GitGutter {{{3
nnoremap <leader>gu :GitGutterAll<CR>
"}}}3
"}}}2
" Pencil {{{2
nnoremap <silent> <leader>p :PencilToggle<CR>
"}}}2
" FoldFocus {{{2
nnoremap <leader><CR> :call FoldFocus('vnew')<CR>
"}}}2
" SLIME {{{2
let g:slime_target = "tmux"
"}}}2
" Rainbow Parentheses {{{2
let g:rainbow_active = 1
nnoremap <silent> <leader>( :RainbowToggle<CR>

" Configure rainbow options {{{3

" Explanation {{{4
" guifgs: colors for gui interface, will be used in order
" ctermfgs: colors for terminals, will be used in order
" operators: describe operators you want to highlight
" parentheses:  describe what will be processed as parentheses
" separately: configure for filetypes. Use '0' as value to disable for that filetype
" Empty field uses the default
"}}}4

let g:rainbow_conf = {
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\       },
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\       'css': 0,
\   }
\}
"}}}3
"}}}2
" Thesaurus {{{2
nnoremap <silent> <localleader>K :PyThesaurusCurrentWord<CR>
"}}}2
" vim-sneak {{{2
let g:sneak#s_next = 1
"}}}2

"}}}1
"EXTERNAL{{{1

runtime CPrototypes.vim      " Prototype generation for C headers
runtime BuildStatusline.vim  " Load up custom statusline
runtime ModeAwareCursor.vim
" runtime LoadColorScheme.vim

"}}}1
" AFTER{{{1

colorscheme gruvbox

" Highlights{{{2
" Set highlighting for default colorscheme{{{3
if( (!exists('g:colors_name') || g:colors_name ==# 'default') && (exists('&bg') && &bg ==# 'light' ))
    hi Comment ctermfg=Cyan
    hi Search cterm=NONE ctermfg=black ctermbg=blue
    hi Visual cterm=NONE ctermfg=black ctermbg=130
    hi Folded cterm=NONE ctermfg=93 ctermbg=black
endif
"}}}3

" augroup highlights{{{3
augroup highlights
    autocmd!
    au ColorScheme default hi Comment ctermfg=Cyan
    au ColorScheme default hi Search cterm=NONE ctermfg=black ctermbg=blue
    au ColorScheme default hi Visual cterm=NONE ctermfg=black ctermbg=130
    au ColorScheme default hi Folded cterm=NONE ctermfg=93 ctermbg=black
augroup END

"}}}3
"}}}2

" Tmux-like splitscreen{{{2
" Set split separator to Unicode box drawing character
set encoding=utf8
set fillchars=vert:│

" Override color scheme to make split the same color as tmux's default
augroup vertspl
    autocmd!
    au ColorScheme * highlight VertSplit cterm=NONE ctermbg=NONE
augroup END
"}}}2

"}}}1

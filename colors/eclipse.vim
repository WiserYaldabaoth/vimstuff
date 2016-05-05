" File:        eclipse.vim
" Description: Eclipse vim colorscheme with terminal support
" Creator:     baronKarza <baronKarza at stackoverflow.com>
" Maintainer:  Brian Mejorado <bam9523@rit.edu>
" Last Change: 2016 May 04
" Version:	   0.03
" URL:	       http://stackoverflow.com/a/8307967
" Original:    http://www.vim.org/scripts/script.php?script_id=1802
"{{{1

" Setup {{{2
set bg=light

hi clear
if exists("syntax_on")
    syntax reset
endif

let colors_name = "eclipse"
"}}}2

hi Normal       guifg=#121212 guibg=#ffffff                         ctermfg=233   ctermbg=231
hi ErrorMsg     guifg=#ffffff guibg=#287eff gui=bold                ctermfg=115   ctermbg=236       cterm=bold
hi Visual       guifg=#8080ff guibg=fg      gui=reverse             ctermfg=32    ctermbg=NONE        cterm=reverse
hi VisualNOS    guifg=#8080ff guibg=fg      gui=reverse,underline   ctermfg=47 ctermbg=NONE    cterm=reverse,underline
hi Todo         guifg=#ffffff guibg=#005FAF                         ctermfg=25 ctermbg=NONE        cterm=bold
hi Search       guifg=#90fff0 guibg=#2050d0 ctermfg=NONE ctermbg=32  cterm=underline term=underline
hi IncSearch    guifg=#ffffff   guibg=#ceccf7                       ctermfg=32 ctermbg=NONE

hi SpecialKey   guifg=#005FAF                                       ctermfg=25
hi Directory    guifg=#005FAF                                       ctermfg=25
hi Title        guifg=magenta gui=none ctermfg=magenta cterm=bold
hi WarningMsg   guifg=red                                           ctermfg=red
hi WildMenu     guifg=black   guibg=yellow                          ctermfg=black ctermbg=yellow    cterm=none      term=none
hi ModeMsg      guifg=#22cce2       ctermfg=lightblue
hi MoreMsg                                                           ctermfg=darkgreen   ctermfg=darkgreen
hi Question     guifg=green gui=none ctermfg=green cterm=none
hi NonText      guifg=#0030ff       ctermfg=darkblue

hi StatusLine   guifg=blue guibg=darkgray gui=none      cterm=NONE ctermfg=blue ctermbg=gray  term=none term=none
hi StatusLineNC guifg=black guibg=darkgray gui=none     ctermfg=lightgray ctermbg=darkgray term=none cterm=none
hi VertSplit    guifg=black guibg=darkgray gui=none     ctermfg=black ctermbg=gray term=none cterm=none

hi Folded       guifg=#808080 guibg=#000040         ctermfg=NONE ctermbg=NONE cterm=bold term=bold
hi FoldColumn   guifg=#808080 guibg=#000040         ctermfg=darkgrey ctermbg=black cterm=bold term=bold
hi LineNr       guifg=#a8a8a8 guibg=#121212         ctermfg=246 ctermbg=NONE

hi DiffAdd      guibg=green                           ctermbg=green  cterm=none  term=none
hi DiffChange   guibg=darkmagenta ctermbg=magenta cterm=none
hi DiffDelete   ctermfg=red ctermbg=lightred gui=bold guifg=Blue guibg=DarkCyan
hi DiffText cterm=bold ctermbg=yellow gui=bold guibg=Yellow

hi Cursor       guifg=black guibg=yellow ctermfg=black ctermbg=yellow
hi lCursor      guifg=black guibg=NONE ctermfg=black ctermbg=NONE

hi CursorLine  cterm=NONE ctermfg=NONE ctermbg=153
hi CursorColumn ctermfg=NONE ctermbg=159


hi Comment      guifg=#3F7F5F                                   ctermfg=28
hi Constant     guifg=#0000C0                                   ctermfg=19                    cterm=none
hi Special      guifg=#0000C0                                   ctermfg=19                    cterm=none
hi Identifier   guifg=#7F9FBF  gui=bold                             ctermfg=110                   cterm=bold
hi Statement    guifg=#7F0055                           gui=bold                ctermfg=89                    cterm=bold
hi PreProc      guifg=#7F0055                           gui=bold                ctermfg=89                    cterm=bold
hi Type         guifg=#7F0055                           gui=bold                                ctermfg=89                    cterm=bold
hi Underlined   cterm=underline term=underline
hi Ignore       guifg=bg ctermfg=bg

hi TabLine      cterm=NONE ctermfg=black ctermbg=75
hi TabLineFill  cterm=NONE ctermfg=75 ctermbg=75
hi TabLineSel   cterm=NONE ctermfg=black  ctermbg=NONE

" Java: {{{2

hi javaAnnotation ctermfg=darkgray
hi link javaDocTags Identifier
hi javaDocComment ctermfg=blue
hi link javaDocParam javaDocComment
hi javaVarArg ctermfg=brown

" }}}2

"}}}1

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:

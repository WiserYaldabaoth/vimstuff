" File:        eclipse.vim
" Description: Eclipse vim colorscheme with terminal support
" Creator:     baronKarza <baronKarza at stackoverflow.com>
" Maintainer:  Brian Mejorado <bam9523@rit.edu>
" Last Change: 2016 May 04
" Version:	   0.03
" URL:	       http://stackoverflow.com/a/8307967
" Original:    http://www.vim.org/scripts/script.php?script_id=1802

let g:airline#themes#eclipse#palette = {}

function! airline#themes#eclipse#refresh()

  let M0 = airline#themes#get_highlight('Identifier')
  let accents_group = airline#themes#get_highlight('Special')
  let modified_group = [M0[0], '', M0[2], '', '']
  let warning_group = airline#themes#get_highlight2(['Normal', 'bg'], ['Question', 'fg'])

  let s:N1 = airline#themes#get_highlight2(['Normal', 'bg'], ['StatusLineNC', 'bg'])
  let s:N2 = airline#themes#get_highlight2(['StatusLineNC', 'bg'], ['StatusLineNC', 'fg'])
  let s:N3 = airline#themes#get_highlight2(['StatusLineNC', 'bg'], ['CursorLine', 'bg'])
  let g:airline#themes#eclipse#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
  let g:airline#themes#eclipse#palette.normal_modified = { 'airline_c': modified_group }
  let g:airline#themes#eclipse#palette.normal.airline_warning = warning_group
  let g:airline#themes#eclipse#palette.normal_modified.airline_warning = warning_group

  let s:I1 = airline#themes#get_highlight2(['Normal', 'bg'], ['Identifier', 'fg'])
  let s:I2 = s:N2
  let s:I3 = airline#themes#get_highlight2(['Normal', 'fg'], ['StatusLineNC', 'fg'])
  let g:airline#themes#eclipse#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
  let g:airline#themes#eclipse#palette.insert_modified = g:airline#themes#eclipse#palette.normal_modified
  let g:airline#themes#eclipse#palette.insert.airline_warning = g:airline#themes#eclipse#palette.normal.airline_warning
  let g:airline#themes#eclipse#palette.insert_modified.airline_warning = g:airline#themes#eclipse#palette.normal_modified.airline_warning

  let s:R1 = airline#themes#get_highlight2(['Normal', 'bg'], ['Structure', 'fg'])
  let s:R2 = s:I2
  let s:R3 = s:I3
  let g:airline#themes#eclipse#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
  let g:airline#themes#eclipse#palette.replace_modified = g:airline#themes#eclipse#palette.normal_modified
  let g:airline#themes#eclipse#palette.replace.airline_warning = g:airline#themes#eclipse#palette.normal.airline_warning
  let g:airline#themes#eclipse#palette.replace_modified.airline_warning = g:airline#themes#eclipse#palette.normal_modified.airline_warning

  let s:V1 = airline#themes#get_highlight2(['Normal', 'bg'], ['Question', 'fg'])
  let s:V2 = s:N2
  let s:V3 = airline#themes#get_highlight2(['Normal', 'bg'], ['TabLine', 'fg'])
  let g:airline#themes#eclipse#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
  let g:airline#themes#eclipse#palette.visual_modified = { 'airline_c': [ s:V3[0], '', s:V3[2], '', '' ] }
  let g:airline#themes#eclipse#palette.visual.airline_warning = g:airline#themes#eclipse#palette.normal.airline_warning
  let g:airline#themes#eclipse#palette.visual_modified.airline_warning = g:airline#themes#eclipse#palette.normal_modified.airline_warning

  let s:IA = airline#themes#get_highlight2(['TabLine', 'fg'], ['CursorLine', 'bg'])
  let g:airline#themes#eclipse#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)
  let g:airline#themes#eclipse#palette.inactive_modified = { 'airline_c': modified_group }

  let g:airline#themes#eclipse#palette.accents = { 'red': accents_group }

  let s:TF = airline#themes#get_highlight2(['Normal', 'bg'], ['Normal', 'bg'])
  let g:airline#themes#eclipse#palette.tabline = {
    \ 'airline_tab':  s:N2,
    \ 'airline_tabsel':  s:N1,
    \ 'airline_tabtype':  s:V1,
    \ 'airline_tabfill':  s:TF,
    \ 'airline_tabhid':  s:IA,
    \ 'airline_tabmod':  s:I1
    \ }

endfunction

call airline#themes#eclipse#refresh()



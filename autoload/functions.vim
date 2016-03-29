" File: functions.vim
" Description: Contains all of my functions for use within my vimrc.
" Some of these may be moved out later into their own plugins.


"{{{1
" CenterToggle()
"
" Toggles whether the cursor should appear in the center.
" Returns falsey if scrolloff is not 9999 or 0.
fun! functions#CenterToggle() "{{{2
    if !exists("&scrolloff")
        echom "scrolloff dons exits!"
        return 0
    elseif &scrolloff ==# 0
        set scrolloff=9999
        echom "Cursor is now centered."
        return 1
    elseif &scrolloff ==# 9999
        set scrolloff=0
        echom "Cursor is now uncentered."
        return 1
    else
        echom "scrolloff setting must be 0 or 9999 for toggle."
        return 0
    endif
endfun
"}}}2


" RefreshVim()
"
" Re-sources the vimrc document and toggles any settings that need to be
" re-toggled afterward.
if !exists("*RefreshVim") "{{{2
    fun! functions#RefreshVim()
        source $MYVIMRC
        if( g:loaded_airline ==# 1 )
            AirlineRefresh
        endif
    endfun
    command! Recfg call function#RefreshVim()
endif
"}}}2


" EnterEclim()
"
" Checks if mappings should be made.
fun! functions#EnterEclim() "{{{2
    PingEclim
    " Eclim General
    " leader = <leader>ec
    nnoremap <silent> <leader>ecp :Projects<CR>
    nnoremap <silent> <leader>ecd :ProjectProblems<CR>
    nnoremap <silent> <leader>ecb :Buffers<CR>
    nnoremap <silent> <leader>ecl :LocateFile<CR>

    " Eclim Java
    " leader = <leader>ja
    nnoremap <silent> <leader>jaf :%JavaFormat<CR>
    nnoremap <silent> <leader>jai :JavaImportOrganize<CR>
    nnoremap <silent> <leader>jan :JavaRename<CR>

    " Eclim Java Debug
    " leader = <leader>jd
    nnoremap <silent> <leader>jdd :JavaDebug<CR>
    nnoremap <silent> <leader>jdx :JavaDebugStop<CR>
    nnoremap <silent> <leader>jdi :JavaDebugStatus<CR>
    nnoremap <silent> <leader>jdb :JavaDebugBreakpointToggle<CR>
    nnoremap <silent> <leader>jdl :JavaDebugBreakpointList<CR>
    nnoremap <silent> <leader>jdso :JavaDebugStep over<CR>
    nnoremap <silent> <leader>jdsi :JavaDebugStep into<CR>
    nnoremap <silent> <leader>jdsr :JavaDebugStep return<CR>
    nnoremap <silent> <leader>jdts :JavaDebugThreadSuspendAll<CR>
    nnoremap <silent> <leader>jdtr :JavaDebugThreadResume<CR>
    nnoremap <silent> <leader>jdta :JavaDebugThreadResumeAll<CR>
endfun
"}}}2



"}}}1

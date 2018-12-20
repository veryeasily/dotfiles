":[range]SortUnfolded[!] [i][u][r][n][x][o] [/{pattern}/]
"			Sort visible lines in [range]. Lines inside closed folds
"			are kept intact; sorting is done only on the first line
"			of the fold; the other lines inside the fold move with
"			it as a unit.
" Copyright: (C) 2012 Ingo Karkat
"   The VIM LICENSE applies to this scriptlet; see ':help copyright'.
" Inspiration:
"   http://stackoverflow.com/questions/13554191/sorting-vim-folds
function! s:ErrorMsg( text )
    let v:errmsg = a:text
    echohl ErrorMsg
    echomsg v:errmsg
    echohl None
endfunction
function! s:ExceptionMsg( exception )
    " v:exception contains what is normally in v:errmsg, but with extra
    " exception source info prepended, which we cut away.
    call s:ErrorMsg(substitute(a:exception, '^Vim\%((\a\+)\)\=:', '', ''))
endfunction
function! s:GetClosedFolds( startLnum, endLnum )
"******************************************************************************
"* PURPOSE:
"   Determine the ranges of closed folds within the passed range.
"* ASSUMPTIONS / PRECONDITIONS:
"   None.
"* EFFECTS / POSTCONDITIONS:
"   None.
"* INPUTS:
"   a:startLnum First line of the range.
"   a:endLnum   Last line of the range.
"* RETURN VALUES:
"   List of [foldStartLnum, foldEndLnum] elements.
"******************************************************************************
    let l:folds = []
    let l:lnum = a:startLnum
    while l:lnum <= a:endLnum
	let l:foldEndLnum = foldclosedend(l:lnum)
	if l:foldEndLnum == -1
	    let l:lnum += 1
	else
	    call add(l:folds, [l:lnum, l:foldEndLnum])
	    let l:lnum = l:foldEndLnum + 1
	endif
    endwhile
    return l:folds
endfunction
function! s:Join( lnum, isKeepSpace, separator )
    if a:isKeepSpace
	let l:lineLen = len(getline(a:lnum))
	execute a:lnum . 'join!'
	if ! empty(a:separator)
	    if len(getline(a:lnum)) == l:lineLen
		" The next line was completely empty.
		execute 'normal! A' . a:separator . "\<Esc>"
	    else
		call cursor(a:lnum, l:lineLen + 1)
		execute 'normal! i' . a:separator . "\<Esc>"
	    endif
	endif
    else
	execute a:lnum
	normal! J
	if ! empty(a:separator)
	    execute 'normal! ciw' . a:separator . "\<Esc>"
	endif
    endif
endfunction
function! s:JoinFolded( isKeepSpace, startLnum, endLnum, separator )
    let l:folds = s:GetClosedFolds(a:startLnum, a:endLnum)
    if empty(l:folds)
	return [0, 0]
    endif

    let l:joinCnt = 0
    let l:save_foldenable = &foldenable
    set nofoldenable
    try
	for [l:foldStartLnum, l:foldEndLnum] in reverse(l:folds)
	    let l:cnt = l:foldEndLnum - l:foldStartLnum
	    for l:i in range(l:cnt)
		call s:Join(l:foldStartLnum, a:isKeepSpace, a:separator)
	    endfor
	    let l:joinCnt += l:cnt
	endfor
    finally
	let &foldenable = l:save_foldenable
    endtry
    return [len(l:folds), l:joinCnt]
endfunction
function! s:SortUnfolded( bang, startLnum, endLnum, sortArgs )
    let [l:foldNum, l:joinCnt] = s:JoinFolded(1, a:startLnum, a:endLnum, "\<C-V>\<C-J>")
    if empty(l:foldNum)
	call s:ErrorMsg('No folds found')
	return
    endif

    let l:reducedEndLnum = a:endLnum - l:joinCnt
    try
	execute printf('%d,%dsort%s %s', a:startLnum, l:reducedEndLnum, a:bang, a:sortArgs)
    catch /^Vim\%((\a\+)\)\=:E/
	call s:ExceptionMsg(v:exception)
    finally
	silent execute printf('%d,%dsubstitute/\%%d0/\r/g', a:startLnum, l:reducedEndLnum)
    endtry
endfunction
command! -bang -range=% -nargs=* SortUnfolded call setline(<line1>, getline(<line1>)) | call s:SortUnfolded('<bang>', <line1>, <line2>, <q-args>)

"Always on top allows for a single line of text to be sticky even when the page is scrolled
"Author: Manny Adumbire - mannadu.com
"Version: 1.0

let g:aot_linenumber = 1
let g:manny_debug = v:false
let s:aot_folds = []
"
"Main logic
function! alwaysontop#StickLine()
    let s:debug = g:manny_debug ? "debug" : "" 
    let b:cursor_pos = line(".")
    let b:line_below_top = line("w0") + 1
    let b:lastline = line("$")
    if g:aot_linenumber < b:line_below_top
				if len(s:aot_folds) >= 1
							exe s:debug." silent! ". s:aot_folds[0][0]." ,". s:aot_folds[0][1]" foldc"	
							let s:aot_folds = []
			endif
        exe  s:debug g:aot_linenumber.",".b:line_below_top ." fo"
        exe s:debug." call add(s:aot_folds, [g:aot_linenumber, b:line_below_top])"
         exe  " silent! ".g:aot_linenumber.",".b:lastline "foldopen! "
    endif
endfunction


"Setup auto group to prevent messing with default group settings
augroup aot
    au!
    au CursorMoved *  call alwaysontop#StickLine()
augroup END





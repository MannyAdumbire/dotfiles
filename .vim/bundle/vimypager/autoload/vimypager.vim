"vimypager.vim - Exit vim and print to stdout if screen is smaller than number of lines in file
"Author: Manny Adumbire - mannadu.com
"Version: 1.0

"Default value of 0 will only exit if the screen size is less than lines of text to display
let g:vimypager_numlines=0

"Main logic
function! vimypager#Run()
		if g:vimypager_numlines == 0
			let g:vimypager_numlines = line("$")  	
		endif
		let s:height_window = winheight(0)
		if s:height_window < g:vimypager_numlines
				echo "use vim"
		else
		 		%y e
				exe "!echo ".shellescape(@e, 1)
				quit
		endif
endfunction


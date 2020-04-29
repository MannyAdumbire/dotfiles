"Config File for vim
set nocompatible
set cursorline
let mapleader=" "

"Enable find-manpage
runtime! ftplugin/man.vim

"needed to load phpactor as per -> https://raw.githubusercontent.com/phpactor/phpactor/develop/doc/phpactor.txt
autocmd FileType php setlocal omnifunc=phpactor#Complete


"
"
" To disable a plugin, add it's bundle name to the following list
"let g:pathogen_disabled = []

"execute pathogen#infect()

"all plug#begin('~/.vim/bundle')
"all plug#end()

"Settings
filetype plugin indent on
syntax on
colo koehler

"Set Options
set number
set tabstop=4
set shiftwidth=4
set hls
set ic
set history=10000	  
set nowrap
set undolevels=1000
set undoreload=10
set maxfuncdepth=1000 "Show more elements in container objects when debugging
set autochdir "Auto cd to current buffer, SEE -> https://stackoverflow.com/questions/13239464/create-a-new-file-in-the-directory-of-the-open-file-in-vim


"--------------------------------------------------   MAPPINGS --------------------------------------------------

"JQuery surround
map <leader>jq  ysiw)F(i$
"Shell comment
nmap <leader>cs ^i# 
"JS comment
nmap <leader>cjs ^i/*A*/ 
"Html comment
nmap <leader>ch ^i<!--A--> 
"add List of 100 dashes
nmap <leader>dsh  50i-3a 50a-F a
"Show contents of directory 
nmap <leader>dir  tyiW exe"r!ls ".@t  
"Set filetype to SQL`
map <leader>fsql :set ft=sql 

"-----AUto-Commands----- 

"Auto run sass watch when scss is opened
augroup css
	"replace extension
	let b:filename=substitute( @%, '\..*', "" , "g")
	au BufWrite *.scss exe "!sass -q ".@% b:filename.".css"
augroup END 


"save and source vim scripts
augroup myvim 
	au  BufNewFile,BufRead *.vim nnoremap <leader>ws  :w! \| :source %<Enter> 
	"syntax highlighting for unknown file extensions
	au  BufRead *.vue set syntax=html
augroup END

"Plugin Options
let g:airline_theme='solarized_flood'

"Only use Emmet on html/css files
let g:user_emmet_install_global = 0
autocmd FileType html,css,scss,javascript EmmetInstall

"if not enough colors to show regular theme ( eg. on tty1 ) USE theme: 
"Vim stores t_Co as a string: verified usin ------- exe "echo ".type(&t_Co) --------------------
if &t_Co == '8'
	let g:airline_theme='hybrid'
endif


"phpactor mappings 
augroup PhpactorMappings
	au!
	au FileType php nmap <buffer> <Leader>u :PhpactorImportClass<CR>
	au FileType php nmap <buffer> <Leader>e :PhpactorClassExpand<CR>
	au FileType php nmap <buffer> <Leader>ua :PhpactorImportMissingClasses<CR>
	au FileType php nmap <buffer> <Leader>mm :PhpactorContextMenu<CR>
	au FileType php nmap <buffer> <Leader>nn :PhpactorNavigate<CR>
	au FileType php,cucumber nmap <buffer> <Leader>o
				\ :PhpactorGotoDefinition<CR>
	au FileType php,cucumber nmap <buffer> <Leader>Oh
				\ :PhpactorGotoDefinitionHsplit<CR>
	au FileType php,cucumber nmap <buffer> <Leader>Ov
				\ :PhpactorGotoDefinitionVsplit<CR>
	au FileType php,cucumber nmap <buffer> <Leader>Ot
				\ :PhpactorGotoDefinitionTab<CR>
	au FileType php nmap <buffer> <Leader>K :PhpactorHover<CR>
	au FileType php nmap <buffer> <Leader>tt :PhpactorTransform<CR>
	au FileType php nmap <buffer> <Leader>cc :PhpactorClassNew<CR>
	au FileType php nmap <buffer> <Leader>ci :PhpactorClassInflect<CR>
	au FileType php nmap <buffer> <Leader>fr :PhpactorFindReferences<CR>
	au FileType php nmap <buffer> <Leader>mf :PhpactorMoveFile<CR>
	au FileType php nmap <buffer> <Leader>cf :PhpactorCopyFile<CR>
	au FileType php nmap <buffer> <silent> <Leader>ee
				\ :PhpactorExtractExpression<CR>
	au FileType php vmap <buffer> <silent> <Leader>ee
				\ :<C-u>PhpactorExtractExpression<CR>
	au FileType php vmap <buffer> <silent> <Leader>em
				\ :<C-u>PhpactorExtractMethod<CR>
augroup END

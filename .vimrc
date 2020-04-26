"Config File for vim
set nocompatible
set cursorline
let mapleader=" "

"Enable find-manpage
runtime! ftplugin/man.vim
"
" To disable a plugin, add it's bundle name to the following list
let g:pathogen_disabled = []

execute pathogen#infect()


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
set autochdir " As per https://stackoverflow.com/questions/13239464/create-a-new-file-in-the-directory-of-the-open-file-in-vim


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

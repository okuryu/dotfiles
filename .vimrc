set number
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set list
set listchars=eol:\ ,trail:-

filetype plugin indent on

autocmd FileType make set noexpandtab nolist
autocmd FileType go set noexpandtab nolist

let g:neocomplete#enable_at_startup = 1

syntax on
colorscheme solarized

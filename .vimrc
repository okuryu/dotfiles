set number
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set background=dark
set list
set listchars=eol:\ ,trail:-

autocmd filetype make set noexpandtab nolist
autocmd filetype go set noexpandtab nolist

call pathogen#infect()

let g:neocomplcache_enable_at_startup=1

syntax on
colorscheme solarized

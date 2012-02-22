set encoding=utf-8
set fileencodings=ucs-bom,utf-8,euc-jp,iso-2022-jp,sjis,cp932,cp20932
set number
set showmode
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set foldmethod=marker
set t_Co=16
set laststatus=2
set statusline=%<%f\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%4v\ %l/%L
set background=dark
set list
set listchars=eol:\ ,trail:-

autocmd BufEnter Makefile set noexpandtab nolist

call pathogen#infect()

let g:neocomplcache_enable_at_startup=1

syntax on
colorscheme solarized


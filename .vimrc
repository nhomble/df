set nocompatible
filetype off
filetype plugin indent on

syntax on
noremap ; :
noremap m :make<CR>
noremap f :echo @%<CR>
:set number
colorscheme pablo
vmap > >gv
vmap < <gv
set ruler
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab

set visualbell

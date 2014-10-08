" execute pathogen#infect()
" autocmd vimenter * NERDTree

syntax on
noremap ; :
noremap m :make<CR>
noremap f :echo @%<CR>
:set number
colorscheme pablo
vmap > >gv
vmap < <gv
set tabstop=4
set ruler
set autoindent
set softtabstop=4 " backspace key

autocmd FileType make setlocal tabstop=8
autocmd FileType make setlocal noexpandtab

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
set tabstop=4
set shiftwidth=4
set expandtab

if has("autocmd")
	autocmd FileType make setlocal tabstop=4
	autocmd FileType make setlocal noexpandtab
	if v:version > 701
		autocmd Syntax * call matchadd('Todo', '\W\zs\(BUG\|HACK\)')
	endif
endif
		

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

if has("autocmd")
	autocmd FileType make setlocal tabstop=8
	autocmd FileType make setlocal noexpandtab
	if v:version > 701
		autocmd Syntax * call matchadd('Todo', '\W\zs\(HERE\|(BUG\|HACK\|END\|DONE\|NOTE\)')
	endif
endif
		

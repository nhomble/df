set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'rust-lang/rust.vim'

call vundle#end()
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

if has("autocmd")
	autocmd FileType make setlocal tabstop=4
	autocmd FileType make setlocal noexpandtab
	if v:version > 701
		autocmd Syntax * call matchadd('Todo', '\W\zs\(BUG\|HACK\|END\|DONE\|NOTE\)')
	endif
endif
		

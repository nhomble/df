syntax on
noremap ; :
autocmd FileType c      noremap <leader>m :make<CR>

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
set autowrite
set path+=**
set wildmenu

filetype plugin on

try
    call plug#begin("~/.local/share/nvim/site/_plugins")

        Plug 'tpope/vim-sensible'
        Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }

    call plug#end()
catch
    echoerr "Error downloading plugins - is vim-plug missing?"
endtry

syntax on
noremap ; :
noremap m :make<CR>

autocmd FileType go     noremap <leader>m :!go fmt; go build<CR>

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
        Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
        Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

    call plug#end()
catch
    echoerr "Error downloading plugins - is vim-plug missing?"
endtry

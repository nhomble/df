" ---------------------------------------
" Basic Options
" ---------------------------------------
scriptencoding utf-8
set encoding=utf-8      
set colorcolumn=80      " highlights the 80 character limit
set autoread            " reloads unmodified files 
                        " https://neovim.io/doc/user/options.html#'autoread'
set autowrite           " saves modified file at certain lifecycle events
syntax on               " makes colors
set ruler               " shows line number and column in status bar
set number              " adds line numbers
set wildmenu            " adds menu style tab completion
set termguicolors       " adds more colors
colorscheme pablo

" ---------------------------------------
" Indenting Options
" ---------------------------------------
set tabstop=4               " sets number of columns per tab
set expandtab               " converts tabs to whitespace
set shiftwidth=4            " sets width for autoindents
set autoindent              " indents a new line with the same as the line just
                            " typed
filetype plugin indent on   " auto-indenting depending on file type

" ---------------------------------------
" Custom Mappings
" ---------------------------------------

" make command mode super easy
noremap ; :             
" make it easier to leave insertion mode
inoremap jj <esc>
inoremap ii <esc>

" keeps the current visual block selection active after changing indent
vmap > >gv
vmap < <gv

noremap m :make<CR>


let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

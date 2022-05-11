" ---------------------------------------
" Basic Options
" ---------------------------------------
scriptencoding utf-8
set encoding=utf-8      
set autoread            " reloads unmodified files 
                        " https://neovim.io/doc/user/options.html#'autoread'
set autowrite           " saves modified file at certain lifecycle events
syntax on               " makes colors
set ruler               " shows line number and column in status bar
set number              " adds line numbers
set wildmenu            " adds menu style tab completion

" ---------------------------------------
" Indenting Options
" ---------------------------------------
set autoindent              " indents a new line with the same as the line just
                            " typed
setlocal shiftwidth=2
setlocal tabstop=2
setlocal softtabstop=2
setlocal expandtab
filetype on 
filetype indent on 
filetype plugin indent on   " auto-indenting depending on file type

source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/colors.vim

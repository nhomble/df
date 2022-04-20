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
set tabstop=2               " sets number of columns per tab
set expandtab               " converts tabs to whitespace
set shiftwidth=2            " sets width for autoindents
set autoindent              " indents a new line with the same as the line just
                            " typed
filetype plugin indent on   " auto-indenting depending on file type

source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/colors.vim

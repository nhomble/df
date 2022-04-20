let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" after changing, don't forget to run :PlugInstall
call plug#begin()
  Plug 'vim-syntastic/syntastic'
  Plug 'morhetz/gruvbox'
  Plug 'rust-lang/rust.vim'
call plug#end()

source $HOME/.config/nvim/syntastic.vim

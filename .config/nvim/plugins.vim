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
  Plug 'preservim/tagbar'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'neoclide/coc.nvim'
call plug#end()

" ------------------------------------
" syntastic
" ------------------------------------
" recommended settings for newbies
" mentioned in README.md https://github.com/vim-syntastic/syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ------------------------------------
" rust-lang/rust
" ------------------------------------

let g:rustfmt_autosave = 1
" ------------------------------------
" rust-lang/rust
" ------------------------------------
noremap tt :TagbarToggle <CR>

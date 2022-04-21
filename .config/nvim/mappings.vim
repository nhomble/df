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

noremap fp :echo @%<CR>

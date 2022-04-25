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

" improves tab handling
noremap tn :tabnew <CR>
noremap t[ :tabprevious <CR>
noremap t] :tabnext <CR>
noremap tl :tabs <CR>

nnoremap vrc :tabnew ~/.vimrc<cr>
nnoremap rvrc :so ~/.vimrc<cr>


nnoremap <S-H> :vertical resize -5<crk
"nnoremap <S-K> :resize +5<cr>
"nnoremap <S-J> :resize -5<cr>
nnoremap <S-L> :vertical resize +5<cr>


set hidden
set number
set splitright 
set expandtab

nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

map <C-l> :tabn<CR>
map <C-h> :tabp<CR>

set clipboard=unnamedplus

set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

let g:session_autosave = 'yes'
let g:session_autoload = 'no'
" let g:session_autoload = 'yes'

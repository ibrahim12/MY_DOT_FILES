set number

map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>

nnoremap <S-H> :vertical resize -5<cr>
nnoremap <S-L> :vertical resize +5<cr>

nnoremap vrc :tabnew ~/.vim_runtime/my_configs.vim<cr>
nnoremap rvrc :so ~/.vim_runtime/my_configs.vim<cr>

nnoremap ,lp "0p

noremap <A-j>  :-tabmove<cr>
noremap <A-;> :+tabmove<cr>

autocmd Filetype html setlocal softtabstop=2 shiftwidth=2 tabstop=2 noautoindent
autocmd Filetype javascript setlocal softtabstop=2 shiftwidth=2 tabstop=2 noautoindent
autocmd Filetype vue setlocal softtabstop=2 shiftwidth=2 tabstop=2 noautoindent
autocmd FileType python     setlocal shiftwidth=4 softtabstop=4 expandtab smarttab tabstop=4

set spelllang=en_us
nmap <silent> <leader>s :set spell!<CR>

set clipboard=unnamed


set foldmethod=indent
set foldlevel=1
set foldclose=all

" let g:syntastic_python_checkers = ['pylint']
" let g:syntastic_python_pylint_args = '--rcfile=config/pylint.rc' 
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 1

let b:ale_linters = ['pylint']
let g:ale_python_pylint_options = '--rcfile=config/pylint.rc'

let g:ale_list_window_size = 5

let g:ale_fixers = {
\  'javascript': ['eslint'],
\  'python': ['black'],
\}


let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

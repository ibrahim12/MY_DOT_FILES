filetype plugin indent on
syntax on

let mapleader=","
let NeerdTreeWindowSize = 1
let g:netrw_liststyle=3

set nocompatible
set number
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set autochdir

" set the runtime path to include Vundle and Initialzie
set  rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" vim git wrapper, 
Plugin 'tpope/vim-fugitive'

" vim NeerdTree
Plugin 'scrooloose/nerdtree'

" vim ctrP
Plugin 'kien/ctrlp.vim'

" vim vim-javascript-syntax
Plugin 'jelera/vim-javascript-syntax'

" vim autocompelte 
Plugin 'Valloric/YouCompleteMe'

" vim tagbar
Plugin 'majutsushi/tagbar'

call vundle#end()




" autocmd

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


" maps 

map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-n> :tabnew<CR>

nnoremap <silent> <Leader>b :TagbarToggle<CR>
nnoremap <leader>. :CtrlPTag<cr>
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>






let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
   \ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$',
     \ 'file': '\.so$\|\.dat$|\.DS_Store$'
       \ }

let g:ctrlp_cmd = 'CtrlPMixed'









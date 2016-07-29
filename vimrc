set nocompatible
set noswapfile
filetype off
set t_Co=256

" highlight all occurence of a selected word
set hlsearch

" set split direction
set splitbelow
set splitright

set wildmenu

set encoding=utf-8

" map leader
let mapleader=","

" backspcae fix
set backspace=indent,eol,start

" enable syntax highlighting 
syntax enable

" show line number
set number

" show a visual line under the cursor's current line
set cursorline 

" show the matching part of the pair for [] {} and ()
set showmatch

" enable all Python syntax highlighting features 
let python_highlight_all = 1

" remember more commands and serach history 
set history=1000

" use many muchos levels of undo
set undolevels=1000

" enable mouse
set mouse=a

"set to auto read when a file is changed from the outside 
set autoread


" ignore compiled files
set wildignore=*.o,*~,&.pyc

set viminfo+=! " make sure vim history works



" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

""Vim Basic 
Plugin 'nathanaelkane/vim-indent-guides'
" Plugin 'Raimondi/delimitMate'
Plugin 'flazz/vim-colorschemes'
Plugin 'Valloric/YouCompleteMe'
Plugin 'kien/ctrlp.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tmhedberg/SimpylFold'
Plugin 'godlygeek/tabular'
" Plugin 'python-rope/ropevim'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
"Plugin 'myusuf3/numbers.vim'
Plugin 'scrooloose/syntastic'
" Plugin 'ternjs/tern_for_vim'
" Plugin 'matze/vim-move'
Plugin 'nvie/vim-flake8'
Plugin 'lepture/vim-jinja'

" JSX Plugin
Plugin 'mxw/vim-jsx'

""Vim Python
Plugin 'vim-scripts/indentpython.vim'


""Vim Javascript 
"Plugin 'jelera/vim-javascript-syntax'
"Plugin 'pangloss/vim-javascript'
"Plugin 'bigfish/vim-js-context-coloring'
"Plugin 'othree/jspc.vim'
"Plugin 'maksimr/vim-jsbeautify'
"Plugin 'matthewsimo/angular-vim-snippets'
"
call vundle#end()

"""" Settings

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" map <C-n> :NERDTreeToogle<CR>
" let NERDTreeMapOpenInTab='<ENTER>'
let g:NERDTreeWinSize=20
let NERDTreeIgnore = ['\.pyc$']

map <leader>n <plug>NERDTreeTabsToggle<CR>



" These are the tweaks I apply to YCM's config, you don't need them but they might help.
" YCM gives you popups and splits by default that some people might not like, so these should tidy it up a bit for you.

let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>



" This does what it says on the tin. It will check your file on open too, not just on save.
" You might not want this, so just leave it out if you don't.


" colo monokai 

vmap <C-x> :!pbcopy<CR>  
vmap <C-c> :w !pbcopy<CR><CR> 

nnoremap <leader>W :w !sudo tee % > /dev/null<CR>
nnoremap <leader>w :w<cr>
" Centering the cursor
"nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>
"nnoremap j jzz
"nnoremap k kzz
"nnoremap n nzz
"nnoremap N Nzz
"nnoremap * *zz
"nnoremap # #zz
"nnoremap g* g*zz
"nnoremap g# g#zz
"
" shortcut remap
nnoremap '; :
noremap <leader><Tab> <Esc>

nnoremap ;' :CtrlPTag<CR>
nnoremap <silent> <Leader>b :TagbarToggle<CR>

" Set Space to Fold/Unfold
nnoremap <space> za
" ; to cntrpBuffer
noremap <leader>; :CtrlPBuffer<CR>


map <C-J> <C-W>j<C-W>_ " open and maximize the split below
map <C-K> <C-W>k<C-W>_ " open and maximize the split above
set wmh=0 " reduces splits to a single line 

map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-n> :tabnew<CR>

"split navigations
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-Li>
"nnoremap <C-H> <C-W><C-H>

nnoremap vrc :tabnew ~/.vimrc<cr>
nnoremap rvrc :so ~/.vimrc<cr>


let g:ctrlp_map = ';;'
nnoremap <S-H> :vertical resize -5<cr>
"nnoremap <S-K> :resize +5<cr>
"nnoremap <S-J> :resize -5<cr>
nnoremap <S-L> :vertical resize +5<cr>
" Automatic commands
if has("autocmd")
        " Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
endif

" Enable folding 

set foldmethod=indent
set foldlevel=99
let g:SimpylFold_docstring_preview=1


set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab


" PEP8 INDENTATION

"au BufNewFile, BufRead *.py
"	\ set tabstop=4
"	\ set softtabstop=4
"	\ set shiftwidth=4
"	\ set textwidth=79
"	\ set expandtab
"	
"	\ set fileformat=unix


"au BufNewFile,BufRead *.js, *.html, *.css
"	\ set tabstop=2
"	\ set softtabstop=2
"	\ set shiftwidth=2
"	
" Flat for Unnecessary White space 

" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"python with virtualenv support
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"	project_base_dir = os.environ['VIRTUAL_ENV']
"	activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"	execfile(activate_this, dict(__file__=activate_this))
"EOF
"

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux


let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$|node_modules|bower_components|vendors|env|static\/build|static\/bower', 
	\ 'file': '\v\.(exe|so|dll|pyc)$', 
	\ 'link': 'some_bad_symbolic_links', 
	\ } 

" Make it uncomment when Needed to clear cache so often
function! SetupCtrlP()
  if exists("g:loaded_ctrlp") && g:loaded_ctrlp
    augroup CtrlPExtension
      autocmd!
      autocmd FocusGained  * CtrlPClearCache
      autocmd BufWritePost * CtrlPClearCache
    augroup END
  endif
endfunction
if has("autocmd")
  autocmd VimEnter * :call SetupCtrlP()
endif



" rope config
" let ropevim_vim_completion=1
" let ropevim_extended_complete=1
" let g:airline#extensions#tabline#enabled = 1

" Commenting blocks of code.
autocmd FileType c,cpp,java,javascript,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>


au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm set ft=jinja


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
 
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']
 
" copy to clipboard
nnoremap ,y "*y




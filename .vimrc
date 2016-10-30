set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'scrooloose/nerdtree'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Valloric/YouCompleteMe' " pip install jedi for python
Plugin 'junegunn/rainbow_parentheses.vim'
Plugin 'scrooloose/syntastic'
Plugin 'ARM9/arm-syntax-vim'
Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-unimpaired'
Plugin 'sjl/badwolf'
Plugin 'haya14busa/incsearch.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'wellle/targets.vim'
Plugin 'justinmk/vim-sneak'

call vundle#end()

filetype on
filetype plugin on
filetype indent on
syntax enable

set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%]%=[%04l,%04v]
set autoindent
set textwidth=80
set linebreak
set breakindent
set wildmenu
set backspace=indent,eol,start
set ttyfast
set title
set scrolloff=5
set encoding=utf-8

" Folding options
set foldmethod=indent
set foldlevelstart=99
set foldlevel=99

" Toggle into number when insert mode selected
set relativenumber
autocmd InsertEnter * :set norelativenumber | set number
autocmd InsertLeave * :set nonumber | set relativenumber

" Either this or janah
colorscheme badwolf

" Rainbows
let g:rainbow_active = 1
au VimEnter * RainbowParentheses

" NERDtree toggle
noremap <F1> :NERDTreeToggle<CR>
" Tagbar toggle
noremap <F2> :TagbarToggle<CR>

" move with Ctrl+<movement key>
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l

" Bindings for UltiSnip
let g:UltiSnipsExpandTrigger = "<c-q>"
let g:UltiSnipsJumpForwardTrigger = "<c-q>"
let g:UltiSnipsJumpBackwardTrigger = "<c-w>"

" Always show the bar
set laststatus=2

" Control+s to save+Fixwhitespace
map <C-s> :FixWhitespace<CR>:w<CR>
map! <C-s> <Esc>:FixWhitespace<CR>:w<CR>
" Use those r00t rights
map <C-e> :w !sudo tee %<CR>
map! <C-e> <Esc>:w !sudo tee %<CR>

" Close completion window after use
let g:ycm_autoclose_preview_window_after_completion=1
" Play nice with the C family
let g:ycm_show_diagnostics_ui = 0
nnoremap <leader>g :YcmCompleter GoTo<CR>

" Pastetoggle
set pastetoggle=<F11>

" Syntastic options
noremap <Leader>e :Errors<cr>
let g:syntastic_python_checkers=['flake8']
let g:syntastic_c_checkers=['gcc']
let g:syntastic_python_flake8_args='--ignore=E128,E231,E122,F403,E501'
let g:syntastic_check_on_open = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

" cursor moves as expected with wrapped lines
map <silent> k gk
map <silent> j gj

" Hardcore vim user detected
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>
" And stop reaching for <Esc>
inoremap jk <Esc>

" Search & Highlighting options
set ignorecase
set smartcase
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" Unmap ex mode
nnoremap Q <nop>
set nobackup
set noswapfile

" Rc Reload
noremap <leader>rr :source ~/.vimrc<CR>
" Rc Edit
noremap <leader>re :tabe ~/.vimrc<CR>
" Hex read
noremap <Leader>hr :%!xxd<CR> :set filetype=xxd<CR>
" Hex write
noremap <Leader>hw :%!xxd -r<CR> :set binary<CR> :filetype detect<CR>
" Snippet Python
noremap <Leader>sp :tabe ~/.vim/bundle/vim-snippets/snippets/python.snippets<CR>
" Snippet C
noremap <Leader>sc :tabe ~/.vim/bundle/vim-snippets/snippets/c.snippets<CR>
" Snippet Tex
noremap <Leader>st :tabe ~/.vim/bundle/vim-snippets/snippets/tex.snippets<CR>
" cd
noremap <leader>cd :lcd %:h<CR>
" Execute Python
noremap <Leader>ep :!python %<CR>

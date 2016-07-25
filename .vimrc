set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
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
Plugin 'rdnetto/YCM-Generator'

call vundle#end()
" Easier sourcing
map <leader>rr :source ~/.vimrc<CR>  

filetype on
filetype plugin indent on
filetype indent on

set autoindent
set textwidth=80
set breakindent
set wildmenu
set backspace=indent,eol,start

" Toggle into number when insert mode selected
set relativenumber
autocmd InsertEnter * :set norelativenumber | set number
autocmd InsertLeave * :set nonumber | set relativenumber

syntax enable

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
let g:UltiSnipsExpandTrigger = "<s-q>"
let g:UltiSnipsJumpForwardTrigger = "<s-q>"
let g:UltiSnipsJumpBackwardTrigger = "<s-w>"

" Always show the bar
set laststatus=2

" Control+s to save
map <C-s> :w<CR>
map! <C-s> <Esc>:w<CR>
" Use those r00t rights
map <C-e> :w !sudo tee %<CR>
map! <C-e> <Esc>:w !sudo tee %<CR>

" Close completion window after use
let g:ycm_autoclose_preview_window_after_completion=1
" Play nice with the C family
let g:ycm_show_diagnostics_ui = 0

" Fix whitespace with Control+d
map <C-d> :FixWhitespace<CR>
map! <C-d> <Esc>:FixWhitespace<CR>

au BufNewFile,BufRead *.s,*.S set filetype=arm " arm = armv6/7

" Pastetoggle
set pastetoggle=<F11>

" Syntastic options
map <Leader>e :Errors<cr>
let g:syntastic_python_checkers=['flake8']
let g:syntastic_c_checkers=['clang_check']
let g:syntastic_python_flake8_args='--ignore=E128,E231,E122,F403,E501'
let g:syntastic_check_on_open = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

" cursor moves as expected with wrapped lines
map <silent> k gk
map <silent> j gj

" break the arrow keys habbit once and for all...
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

set smartcase
set hlsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

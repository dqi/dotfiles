set nocompatible
filetype off
set autoindent
set textwidth=80
set breakindent

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Valloric/YouCompleteMe' " pip install jedi for python
Plugin 'junegunn/rainbow_parentheses.vim'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-sleuth'
Plugin 'ARM9/arm-syntax-vim'
Plugin 'ConradIrwin/vim-bracketed-paste'

call vundle#end()
filetype plugin indent on

syntax enable
let g:solarized_termcolors=256 "export TERM=xterm-256color
colorscheme solarized
set background=dark

filetype indent on
set number
set wildmenu

" Rainbows
let g:rainbow_active = 1
au VimEnter * RainbowParentheses

" NERDtree toggle
noremap <F1> :NERDTreeToggle<CR>

" Bindings for UltiSnip
let g:UltiSnipsExpandTrigger = "<s-q>"
let g:UltiSnipsJumpForwardTrigger = "<s-q>"
let g:UltiSnipsJumpBackwardTrigger = "<s-w>"

set laststatus=2

" Control+s to save
map <C-s> :w<CR>
map! <C-s> <Esc>:w<CR>

" Control+e to save as root
map <C-e> :w !sudo tee %<CR>
map! <C-e> <Esc>:w !sudo tee %<CR>


" Close completion window after use
let g:ycm_autoclose_preview_window_after_completion=1

" Fix whitespace with Control+d
map <C-d> :FixWhitespace<CR>
map! <C-d> <Esc>:FixWhitespace<CR>

au BufNewFile,BufRead *.s,*.S set filetype=arm " arm = armv6/7

" Pastetoggle
set pastetoggle=<F2>

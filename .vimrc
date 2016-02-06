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

call vundle#end()
filetype plugin indent on

syntax enable
let g:solarized_contrast="high"
let g:solarized_termcolors=256 "export TERM=xterm-256color
colorscheme solarized
set background=dark

filetype indent on
set number
set autoindent

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

" Close completion window after use
let g:ycm_autoclose_preview_window_after_completion=1

" Fix whitespace with Control+d
map <C-d> :FixWhitespace<CR>
map! <C-d> :FixWhitespace<CR>

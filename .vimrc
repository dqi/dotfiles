set nocompatible
filetype off
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
Plugin 'majutsushi/tagbar'
Plugin 'Yggdroot/indentLine'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'

call vundle#end()
filetype on
filetype plugin indent on
filetype indent on

set autoindent
set textwidth=80
set breakindent
set wildmenu
set backspace=indent,eol,start

" Setup relative line numbers and a toggle
set relativenumber
function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set nonumber
        set relativenumber
    endif
endfunc

" Toggle into number when insert mode selected
autocmd InsertEnter * :set norelativenumber | set number
autocmd InsertLeave * :set nonumber | set relativenumber

syntax enable
let g:solarized_termcolors=256 "export TERM=xterm-256color
colorscheme solarized
set background=dark

" Rainbows
let g:rainbow_active = 1
au VimEnter * RainbowParentheses

" NERDtree toggle
noremap <F1> :NERDTreeToggle<CR>
" Tagbar toggle
noremap <F2> :TagbarToggle<CR>

" move with Ctrl+<movement key>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-Left> <c-w>h
map <c-l> <c-w>l
map <c-Right> <c-w>l

" Bindings for UltiSnip
let g:UltiSnipsExpandTrigger = "<s-q>"
let g:UltiSnipsJumpForwardTrigger = "<s-q>"
let g:UltiSnipsJumpBackwardTrigger = "<s-w>"

set laststatus=2

" Control+s to save
map <C-s> :w<CR>
map! <C-s> <Esc>:w<CR>
" Use those r00t rights
map <C-e> :w !sudo tee %<CR>
map! <C-e> <Esc>:w !sudo tee %<CR>


" Close completion window after use
let g:ycm_autoclose_preview_window_after_completion=1

" Fix whitespace with Control+d
map <C-d> :FixWhitespace<CR>
map! <C-d> <Esc>:FixWhitespace<CR>

au BufNewFile,BufRead *.s,*.S set filetype=arm " arm = armv6/7

" Pastetoggle
set pastetoggle=<F11>
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=E231,E122,F403,E501'

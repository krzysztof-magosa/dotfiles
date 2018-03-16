set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-sensible'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'editorconfig/editorconfig-vim'
"Plugin 'joshdick/onedark.vim'
Plugin 'mhinz/vim-janah'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Shougo/denite.nvim'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-syntastic/syntastic'
Plugin 'sheerun/vim-polyglot'
Plugin 'haya14busa/incsearch.vim'
Plugin 'hecal3/vim-leader-guide'
Plugin 'mhinz/vim-startify'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'Yggdroot/indentLine'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'ervandew/supertab'
Plugin 'valloric/youcompleteme'
Plugin 'thaerkh/vim-workspace'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'wincent/command-t'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Appearance
syntax on
"colorscheme onedark
colorscheme janah
set cursorline
set number
set relativenumber
set ruler
set hlsearch
set incsearch
set ignorecase
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


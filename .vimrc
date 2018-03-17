set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-sensible'                   " Default reasonable settings
Plugin 'junegunn/fzf'                         " Fuzzy Search (Engine)
Plugin 'junegunn/fzf.vim'                     " Fuzzy Search (Plugin)
Plugin 'editorconfig/editorconfig-vim'        " Support for .editorconfig files
Plugin 'NLKNguyen/papercolor-theme'           " ColorScheme similar to Material Theme
Plugin 'vim-airline/vim-airline'              " Status bar (Core)
Plugin 'vim-airline/vim-airline-themes'       " Status bar (Themes)
Plugin 'airblade/vim-gitgutter'               " Mark git changes in rail
Plugin 'vim-syntastic/syntastic'              " Syntax checker
Plugin 'sheerun/vim-polyglot'                 " Support for many languages
Plugin 'mhinz/vim-startify'                   " Startup page
Plugin 'Raimondi/delimitMate'                 " Close parens etc.
Plugin 'tpope/vim-commentary'                 " (Un)Comment code
Plugin 'scrooloose/nerdtree'                  " File explorer
Plugin 'tpope/vim-fugitive'                   " Git utilities
Plugin 'Yggdroot/indentLine'                  " Show indentations
Plugin 'terryma/vim-multiple-cursors'         " Multiple cursors, like in Sublime
Plugin 'ntpeters/vim-better-whitespace'       " Highlight trailing whitespaces
Plugin 'wincent/command-t'                    " Navigation through project files

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Appearance
syntax on
set background=dark
colorscheme PaperColor
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'

" Various options
set cursorline
set number
set relativenumber
set ruler
set hlsearch
set incsearch
set ignorecase

" Split more naturally
set splitbelow
set splitright

" Temporary files (swap etc.)
set directory=~/.vim/tmp

" Indentation
set tabstop=2
set shiftwidth=2
set softtabstop=0
set expandtab
set smarttab

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_yaml_checkers = ['yamllint']

" Custom key bindings
map <leader>g :Ag<CR>

" Remember line in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


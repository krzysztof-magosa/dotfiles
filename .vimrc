set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'junegunn/fzf'                         " Fuzzy Search (Engine)
Plugin 'junegunn/fzf.vim'                     " Fuzzy Search (Plugin)
Plugin 'editorconfig/editorconfig-vim'        " Support for .editorconfig files
Plugin 'NLKNguyen/papercolor-theme'           " ColorScheme similar to Material Theme
Plugin 'vim-airline/vim-airline'              " Status bar (Core)
Plugin 'vim-airline/vim-airline-themes'       " Status bar (Themes)
Plugin 'airblade/vim-gitgutter'               " Mark git changes in rail
Plugin 'vim-syntastic/syntastic'              " Syntax checker
Plugin 'lepture/vim-jinja'                    " Support for jinja files
Plugin 'mhinz/vim-startify'                   " Startup page
Plugin 'Raimondi/delimitMate'                 " Close parens etc.
Plugin 'tpope/vim-commentary'                 " (Un)Comment code
Plugin 'tpope/vim-fugitive'                   " Git utilities
Plugin 'nathanaelkane/vim-indent-guides'      " Show indentations
Plugin 'terryma/vim-multiple-cursors'         " Multiple cursors, like in Sublime
Plugin 'ntpeters/vim-better-whitespace'       " Highlight trailing whitespaces
Plugin 'wincent/command-t'                    " Navigation through project files
Plugin 'EESchneider/vim-rebase-mode'          " Git rebase helper

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Appearance
syntax on
set background=dark
colorscheme PaperColor
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='papercolor'

" Better whitespace
let g:better_whitespace_enabled = 1
let g:strip_whitespace_on_save = 1
let g:strip_whitelines_at_eof = 1

" Various options
set lazyredraw                                " Do not refresh screen during macros/scripts
set cursorline                                " Highlight current line
set number                                    " Line numbers
set relativenumber                            " Line numbers to be relative
set ruler                                     " Show cursor position
set hlsearch                                  " Highlight searches
set incsearch                                 " Incremental search
set ignorecase                                " Ignore case during search
set smartcase                                 " Be case sensitive when needed
set wildmenu                                  " Command line autcompletion as menu
set wildmode=list:longest                     " Better wildmenu
set showcmd                                   " Show incomplete commands
set list listchars=tab:»·,trail:·,nbsp:·      " Display whitespaces
set history=1000                              " Bigger list of used commands
set virtualedit=onemore                       " Allow cursor to go beyond last character
set undofile                                  " Allow to undo even after vim restart

" Split more naturally
set splitbelow
set splitright

" Temporary files (swap etc.)
set directory=~/.vim/tmp
if !isdirectory(&directory)
  call mkdir(&directory, "p")
endif

set undodir=~/.vim/undo-dir
if !isdirectory(&undodir)
  call mkdir(&undodir, "p")
endif

" Indentation
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set shiftround
set autoindent
let g:indent_guides_enable_on_vim_startup = 1

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
vmap <leader>y :w !pbcopy<CR><CR>
nmap <leader>p :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>

" Remember line in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

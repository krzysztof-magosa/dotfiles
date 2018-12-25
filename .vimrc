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
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'airblade/vim-gitgutter'               " Mark git changes in rail
Plugin 'itchyny/lightline.vim'                " Light Line
Plugin 'vim-syntastic/syntastic'              " Syntax checker
Plugin 'lepture/vim-jinja'                    " Support for jinja files
Plugin 'Raimondi/delimitMate'                 " Close parens etc.
Plugin 'tpope/vim-commentary'                 " (Un)Comment code
Plugin 'tpope/vim-fugitive'                   " Git utilities
Plugin 'nathanaelkane/vim-indent-guides'      " Show indentations
Plugin 'terryma/vim-multiple-cursors'         " Multiple cursors, like in Sublime
Plugin 'ntpeters/vim-better-whitespace'       " Highlight trailing whitespaces
Plugin 'EESchneider/vim-rebase-mode'          " Git rebase helper
Plugin 'b4b4r07/vim-ansible-vault'            " Ansible Vault support
Plugin 'pbrisbin/vim-mkdir'                   " Create missing dirs on save
Plugin 'kshenoy/vim-signature'                " Vim marks gutter
Plugin 'apple/swift', {'rtp': 'utils/vim/'}
Plugin 'Shougo/deoplete.nvim'
Plugin 'mitsuse/autocomplete-swift'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Appearance
if !has('gui_running')
  set t_Co=256
endif

syntax on
set background=dark
colorscheme PaperColor

let g:lightline = {
  \ 'colorscheme': 'powerline',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ], [ 'gitbranch' ],
  \             [ 'readonly', 'filename', 'modified'] ],
  \   'right': [ [ 'syntastic', 'lineinfo' ], [ 'percent' ], [ 'fileformat', 'fileencoding', 'filetype' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head'
  \ },
  \ 'component_expand': {
  \   'syntastic': 'SyntasticStatuslineFlag'
  \ },
  \ 'component_type': {
  \   'syntastic': 'error'
  \ }
  \ }

" Better whitespace
let g:better_whitespace_enabled = 1
let g:strip_whitespace_on_save = 1
let g:strip_whitelines_at_eof = 1

let g:deoplete#sources#swift#daemon_autostart = 1
let g:deoplete#enable_at_startup = 1
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
set hidden                                    " Allow opening another buffers before save
set timeoutlen=1000 ttimeoutlen=0             " Resolve problem with slow ESC
set laststatus=2                              " Always show status line
set foldmethod=indent                         " Folding by indentation
set foldnestmax=3                             " Max 3 levels
set nofoldenable                              " Do not use it by default
set colorcolumn=100
highlight colorcolumn ctermbg=DarkGray

" Split more naturally
set splitbelow
set splitright

" Python
let g:python2_host_prog = "/opt/homebrew/bin/python2"
let g:python3_host_prog = "/opt/homebrew/bin/python3"
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
function! FindConfig(prefix, what, where)
  let cfg = findfile(a:what, escape(a:where, ' ') . ';')
  return cfg !=# '' ? ' ' . a:prefix . ' ' . shellescape(cfg) : ''
endfunction

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_yaml_checkers = ['yamllint']
autocmd FileType yaml let b:syntastic_yaml_yamllint_args =
      \ get(g:, 'syntastic_syntastic_yaml_yamllint_args', '') .
      \ FindConfig('-c', '.yamllint', expand('<afile>:p:h', 1))

" Custom fzf commands
autocmd VimEnter * command! -nargs=* AgWithoutIgnore
      \ call fzf#vim#ag(<q-args>, '-U', 0)

" Custom key bindings
map <leader>g :Ag<CR>
map <leader>G :AgWithoutIgnore<CR>
map <Leader>f :FZF<CR>
map <Leader>d :AnsibleVaultDecrypt<CR>
map <Leader>e :AnsibleVaultEncrypt<CR>
nmap <Leader>b :Buffers<CR>
vmap <leader>y :w !pbcopy<CR><CR>
nmap <leader>p :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>

" Actions for specific files
autocmd BufEnter,BufNew */ansible/hosts/* set filetype=dosini

" Ansible Vault
let g:ansible_vault_password_file = $ANSIBLE_VAULT_PASSWORD_FILE

" Remember line in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

nnoremap <expr> Q getline(".") =~ "<!--" ? ':norm ^5x$F d$' : ':norm I<!-- A -->'

"This allows for change paste motion cp{motion}
nmap <silent> cp :set opfunc=ChangePaste<CR>g@
function! ChangePaste(type, ...)
    silent exe "normal! `[v`]\"_c"
    silent exe "normal! p"
endfunction

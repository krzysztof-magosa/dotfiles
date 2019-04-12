set nocompatible

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf'                         " Fuzzy Search (Engine)
Plug 'junegunn/fzf.vim'                     " Fuzzy Search (Plug)
Plug 'editorconfig/editorconfig-vim'        " Support for .editorconfig files
Plug 'NLKNguyen/papercolor-theme'
Plug 'airblade/vim-gitgutter'               " Mark git changes in rail
Plug 'vim-syntastic/syntastic'              " Syntax checker
Plug 'lepture/vim-jinja'                    " Support for jinja files
Plug 'Raimondi/delimitMate'                 " Close parens etc.
Plug 'tpope/vim-commentary'                 " (Un)Comment code
Plug 'tpope/vim-fugitive'                   " Git utilities
Plug 'tpope/vim-surround'                   " Surround
Plug 'nathanaelkane/vim-indent-guides'      " Show indentations
Plug 'terryma/vim-multiple-cursors'         " Multiple cursors, like in Sublime
Plug 'ntpeters/vim-better-whitespace'       " Highlight trailing whitespaces
Plug 'EESchneider/vim-rebase-mode'          " Git rebase helper
Plug 'b4b4r07/vim-ansible-vault'            " Ansible Vault support
Plug 'pbrisbin/vim-mkdir'                   " Create missing dirs on save
Plug 'kshenoy/vim-signature'                " Vim marks gutter
Plug 'apple/swift', {'rtp': 'utils/vim/'}
Plug 'mitsuse/autocomplete-swift'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'dylon/vim-antlr'
Plug 'michaeljsmith/vim-indent-object'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" Appearance
if !has('gui_running')
  set t_Co=256
endif

syntax on
set background=dark
colorscheme PaperColor


" Better whitespace
let g:better_whitespace_enabled = 1
let g:strip_whitespace_on_save = 1
let g:strip_whitelines_at_eof = 1
let g:strip_only_modified_lines = 1
let g:strip_whitespace_confirm = 0

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
set noshowmode                                " Airline displays mode
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

autocmd VimEnter * command! -bang -nargs=* AgOnlyContent
      \ call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

" Custom key bindings
map <leader>g :AgOnlyContent<CR>
map <leader>G :AgWithoutIgnore<CR>
map <Leader>f :FZF<CR>
map <Esc>[1;9A :m -2<CR>
map <Esc>[1;9B :m +1<CR>

nmap <Leader>b :Buffers<CR>
vmap <leader>y :w !pbcopy<CR><CR>
nmap <leader>p :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>

" Neosnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" Actions for specific files
autocmd BufEnter,BufNew */ansible/hosts/* set filetype=dosini

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

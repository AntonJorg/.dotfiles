" NEOVIM CONFIGURATION
"

" PLUGINS
call plug#begin()
Plug 'nvim-treesitter/nvim-treesitter'
" A Tree-like side bar for better navigation
Plug 'scrooloose/nerdtree'
" A cool status bar
Plug 'vim-airline/vim-airline'
" Airline themes
Plug 'vim-airline/vim-airline-themes'
" Nord
Plug 'morhetz/gruvbox'
" Better syntax-highlighting for filetypes in vim
Plug 'sheerun/vim-polyglot'
" Intellisense engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" TODO: Add installed packages below
" Git integration
Plug 'tpope/vim-fugitive'
" Auto-close braces and scopes
Plug 'jiangmiao/auto-pairs'
" Nim language support
" Plug 'baabelfish/nvim-nim'
" Icons
Plug 'nvim-tree/nvim-web-devicons'
" Fuzzy finder
Plug 'nvim-lua/plenary.nvim'
Plug 'BurntSushi/ripgrep'
Plug 'sharkdp/fd'
Plug 'nvim-telescope/telescope.nvim'
" LaTeX support
Plug 'lervag/vimtex'
call plug#end()

" SETTINGS
" let g:gruvbox_transparent_bg=1
colorscheme gruvbox
hi Normal guibg=None ctermbg=None
" Autocomplete
set completeopt=menu,menuone,noselect
set nofoldenable
set encoding=utf-8
set fileformat=unix
" set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
"set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
" set tabstop=4               " number of columns occupied by a tab 
" set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
" set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number relativenumber   " line numbers are relative to cursor
set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set scrolloff=5             " keep cursor 5 lines from edge when scrolling
set signcolumn=number

set nobackup
set nowritebackup
set updatetime=300

" KEYBINDS
" Remap <leader>
let mapleader = " " " map leader to Space

" Autocomplete selections with ENTER
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"


" Telescope keybinds
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope git_files hidden=true<cr>
nnoremap <leader>fa <cmd>Telescope find_files hidden=true<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" Buffer navigation
noremap <leader>1 :bp<CR>
noremap <leader>2 :bn<CR>
noremap <C-w> :w<CR>:bd<CR>

" NERDTree File Explorer
" Toggle NERDTree Keybind
noremap <silent> <leader>t :NERDTreeToggle<CR>
" Source init.vim easily
nnoremap <leader><leader> :source $MYVIMRC<CR>

" VARIABLES
let NERDTreeQuitOnOpen=1

let g:coc_global_extensions = ['coc-vimlsp', 'coc-prettier', 'coc-git', 'coc-yaml', 'coc-vimtex', 'coc-tsserver', 'coc-toml', 'coc-pyright', 'coc-json', 'coc-css']
" Airline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemode=':t'
" Ultisnips
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/ultisnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" Transparent
let g:transparent_enabled = v:true
" Providers
let g:python3_host_prog = '/bin/python3'
let g:loaded_perl_provider = 0

" Or with a generic interface:
let g:vimtex_view_general_viewer = 'sioyek'
" let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

autocmd BufNewFile,BufRead *.nim, set filetype=nim

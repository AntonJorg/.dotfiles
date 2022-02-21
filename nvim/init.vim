"
" ==== NEOVIM CONFIGURATION ====
"
" SETTINGS
"
set encoding=utf-8
set fileformat=unix
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
"set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set relativenumber          " line numbers are relative to cursor
set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set scrolloff=5             " keep cursor 5 lines from edge when scrolling
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.

"
" PLUGINS
"
call plug#begin("~/.vim/plugged")
 Plug 'gruvbox-community/gruvbox'
 Plug 'ryanoasis/vim-devicons'
 Plug 'SirVer/ultisnips'
 Plug 'honza/vim-snippets'
 Plug 'scrooloose/nerdtree'
 Plug 'preservim/nerdcommenter'
 Plug 'mhinz/vim-startify'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'jiangmiao/auto-pairs'
 Plug 'norcalli/nvim-colorizer.lua'
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
call plug#end()

" Remap <leader>
let mapleader = " " " map leader to Space

" COLOR SCHEME
let g:gruvbox_italics=1
colorscheme gruvbox
let g:airline_theme='gruvbox'

let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemode=':t'
noremap <leader>1 :bp<CR>
noremap <leader>2 :bn<CR>
noremap <C-w> :bd<CR>

" NERDTree File Explorer
let NERDTreeQuitOnOpen=1
" Toggle NERDTree Keybind
noremap <silent> <leader>t :NERDTreeToggle<CR>

" Setup colorizer
if(has("termguicolors"))
    set termguicolors
endif

" lua require 'colorizer'.setup()

" Ultisnips
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/ultisnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Compile and run
map <buffer> <leader>p :w<CR>:!nim c -r %<CR>
" Autosave when leaving insert mode
autocmd InsertLeave * :w
" Smaller tabs
setlocal shiftwidth=2            " width for autoindents
setlocal tabstop=2               " number of columns occupied by a tab 
setlocal softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing

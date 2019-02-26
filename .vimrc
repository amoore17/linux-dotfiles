execute pathogen#infect()
syntax on
filetype plugin indent on

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_option = ' -std=c++17 -stdlib=libc++'

set smartindent
set number
set tabstop=4
set softtabstop=-1
set shiftwidth=4
set expandtab
set colorcolumn=81

set smartindent
set number
set colorcolumn=121
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set modelines=0
set nomodeline
syntax on

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    keepp %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType * autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

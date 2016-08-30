set nocompatible
set number
set whichwrap+=h,l
colorscheme elflord
set expandtab
set shiftwidth=4
set tabstop=4
set smartindent
set smarttab
set autoindent

" clang-format
function! s:clang_format()
    let now_line = line(".")
    exec ":%! clang-format-3.6"
    exec ":" . now_line
endfunction

if executable('clang-format-3.6')
    augroup c_clang_format
        autocmd!
        autocmd BufWrite,FileWritePre,FileAppendPre *.[ch]pp call s:clang_format()
    augroup END
    augroup cpp_clang_format
        autocmd!
        autocmd BufWrite,FileWritePre,FileAppendPre *.[ch] call s:clang_format()
    augroup END
endif

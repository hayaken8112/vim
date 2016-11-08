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
set hlsearch
set backspace=indent,eol,start
set clipboard+=unnamed,autoselect
nnoremap <ESC><ESC> :noh <CR>$
syntax on

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
" neobundle
set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))

"ここにpluginを入れていく
NeoBundle 'fcpg/vim-fahrenheit'
NeoBundle 'scrooloose/nerdtree'
"ここまでにpluginを入れていく

call neobundle#end()
filetype plugin indent on

"installしてないやつがあったらするかチェックしてくれるやつ
NeoBundleCheck

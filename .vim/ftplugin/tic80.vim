" Run cart in current buffer
map <buffer> <localleader>r :w<CR>:silent !tic80 % --skip --fs .<CR>:redraw!<CR>:e<CR>
" Open cart in current buffer in TIC-80
map <buffer> <localleader>o :w<CR>:silent !tic80 --cmd "load %" --skip --fs .<CR>:redraw!<CR>:e<CR>

set tabstop=4
set shiftwidth=4
set softtabstop=4

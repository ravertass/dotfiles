" Run cart in current buffer
map <buffer> <localleader>r :silent !pico8 % -run<CR>:redraw!<CR>:e<CR>
" Open cart in current buffer in PICO-8
map <buffer> <localleader>o :silent !pico8 %<CR>:redraw!<CR>:e<CR>

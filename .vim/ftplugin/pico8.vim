" Run cart in current buffer
map <buffer> <localleader>r :w<CR>:silent !pico8 %:p -run<CR>:redraw!<CR>:e<CR>
" Open cart in current buffer in PICO-8
map <buffer> <localleader>o :w<CR>:silent !pico8 %:p<CR>:redraw!<CR>:e<CR>

local utils = require 'zhuw31.utils'

utils.n_map('<leader>=', '<cmd>vert resize +10<cr>')
utils.n_map('<leader>-', '<cmd>vert resize -10<cr>')

utils.n_map('n', 'nzzzv')
utils.n_map('N', 'Nzzzv')

utils.n_map('<c-h>', '<c-w>h')
utils.n_map('<c-j>', '<c-w>j')
utils.n_map('<c-k>', '<c-w>k')
utils.n_map('<c-l>', '<c-w>l')

utils.v_map('J', [[<cmd>m '>+1<cr>gv=gv]])
utils.v_map('K', [[<cmd>m '<-2<cr>gv=gv]])

utils.i_map('<c-j>', '<ESC>o')
utils.i_map('<c-k>', '<ESC>O')

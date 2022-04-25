vim.keymap.set('n', '<Leader>=', ':vert resize +10<CR>')
vim.keymap.set('n', '<Leader>-', ':vert resize -10<CR>')

vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('n', '<c-h>', '<c-w>h')
vim.keymap.set('n', '<c-j>', '<c-w>j')
vim.keymap.set('n', '<c-k>', '<c-w>k')
vim.keymap.set('n', '<c-l>', '<c-w>l')

vim.keymap.set('v', 'J', [[:m '>+1<CR>gv=gv]])
vim.keymap.set('v', 'K', [[:m '<-2<CR>gv=gv]])

vim.keymap.set('i', '<c-j>', '<ESC>o')
vim.keymap.set('i', '<c-k>', '<ESC>O')

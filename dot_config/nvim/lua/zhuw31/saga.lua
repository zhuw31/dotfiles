local ok, lspsaga = pcall(require, 'lspsaga')

if not ok then
  return
end

lspsaga.init_lsp_saga {
  border_style = 'rounded',
  code_action_lightbulb = {
    enable = false,
  },
  finder_action_keys = {
    vsplit = 'v',
    split = 's',
  },
  rename_in_select = false,
  symbol_in_winbar = {
    enable = false,
    separator = '  ',
  },
  max_preview_lines = 30,
  finder_request_timeout = 3000,
}

local opts = { silent = true }
vim.keymap.set('n', 'go', '<cmd>LSoutlineToggle<cr>', opts)
vim.keymap.set('n', 'gl', '<cmd>Lspsaga show_line_diagnostics<cr>', opts)
vim.keymap.set('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
vim.keymap.set('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', 'gd', '<cmd>Lspsaga preview_definition<cr>', opts)
-- vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>', opts)
vim.keymap.set('n', '<leader>k', '<cmd>Lspsaga signature_help<cr>', opts)
vim.keymap.set('n', 'gn', '<cmd>Lspsaga rename<cr>', opts)
vim.keymap.set('n', 'ga', '<cmd>Lspsaga code_action<cr>', opts)
vim.keymap.set('n', 'gr', '<cmd>Lspsaga lsp_finder<cr>', opts)

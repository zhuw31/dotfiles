local status_ok, trouble = pcall(require, 'trouble')
if not status_ok then
  return
end

trouble.setup {}

local utils = require 'zhuw31.utils'

utils.n_map('<leader>dg', '<cmd>Trouble workspace_diagnostics<cr>')
utils.n_map('gd', '<cmd>Trouble lsp_definitions<cr>')
utils.n_map('<leader>td', '<cmd>Trouble lsp_type_definitions<cr>')
utils.n_map('gi', '<cmd>Trouble lsp_implementations<cr>')
utils.n_map('gr', '<cmd>Trouble lsp_references<cr>')

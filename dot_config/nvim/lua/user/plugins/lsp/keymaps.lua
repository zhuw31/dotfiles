local M = {}

function M.on_attach(client, buffer)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = buffer, desc = desc })
  end

  local tb = require('telescope.builtin')
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Prev diagnostic' })
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
  vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { desc = 'Open f[L]oat' })
  nmap('<leader>sd', tb.diagnostics, '[S]earch [D]iagnostics')

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
  nmap('gm', format, "[Format] Document")
  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', tb.lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('gT', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', tb.lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', tb.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('gk', vim.lsp.buf.signature_help, 'Signature Documentation')
  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
end

return M

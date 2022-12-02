local M = {}

M.setup = function(on_attach, capabilities)
  require('typescript').setup {
    server = {
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        vim.keymap.set('n', 'gi', function()
          local actions = require('typescript').actions
          actions.organizeImports()
        end, { buffer = bufnr })
      end,
      capabilities = capabilities,
    },
  }
end

return M

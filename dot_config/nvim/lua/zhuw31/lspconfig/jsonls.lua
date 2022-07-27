local M = {}

M.setup = function(on_attach, capabilities)
  require('lspconfig').jsonls.setup {
    settings = {
      json = {
        schemas = require('schemastore').json.schemas(),
        format = {
          enable = false,
        },
      },
    },
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

return M

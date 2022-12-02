local M = {}

M.setup = function(on_attach, capabilities)
  require('lspconfig').yamlls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      yaml = {
        hover = true,
        completion = true,
        validate = true,
        schemas = require('schemastore').json.schemas(),
      },
    },
  }
end

return M

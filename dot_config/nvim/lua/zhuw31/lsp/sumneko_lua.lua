local M = {}

M.setup = function(on_attach, capabilities)
  require('lspconfig').sumneko_lua.setup {
    on_attach,
    capabilities,
    single_file_support = true,
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' },
        },
        telemetry = {
          enable = false,
        },
      },
    },
  }
end

return M

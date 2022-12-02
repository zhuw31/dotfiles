local M = {}

function M.setup(on_attach)
  local null_ls = require 'null-ls'
  local b = null_ls.builtins
  local f = b.formatting
  local d = b.diagnostics
  local ca = b.code_actions

  local sources = {
    f.prettierd,
    f.stylua,
    d.eslint_d,
    ca.eslint_d,
    ca.gitsigns,
  }

  null_ls.setup {
    sources = sources,
    on_attach = on_attach,
  }
end

return M

local M = {}

function M.setup(on_attach)
  local null_ls = require 'null-ls'
  local b = null_ls.builtins

  local sources = {
    b.formatting.prettierd,
    b.formatting.stylua,
    b.diagnostics.eslint_d,
    b.diagnostics.stylelint.with { prefer_local = 'node_modules/.bin' },
    b.code_actions.eslint_d,
  }

  null_ls.setup {
    sources = sources,
    on_attach = on_attach,
  }
end

return M

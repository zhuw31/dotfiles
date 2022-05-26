local ok, null_ls = pcall(require, 'null-ls')
if not ok then
  return
end

local sources = {
  null_ls.builtins.formatting.prettierd,
  null_ls.builtins.formatting.stylua,
  null_ls.builtins.diagnostics.eslint_d,
  null_ls.builtins.diagnostics.stylelint.with { prefer_local = 'node_modules/.bin' },
  null_ls.builtins.code_actions.eslint_d,
}

null_ls.setup {
  sources = sources,
}

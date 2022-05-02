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

local lsp_formatting = vim.api.nvim_create_augroup('LspFormatting', {})
local on_attach = function(client, bufnr)
  if client.supports_method 'textDocument/formatting' then
    vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = lsp_formatting,
      buffer = bufnr,
      -- on 0.8, you should use vim.lsp.buf.format instead
      callback = vim.lsp.buf.formatting_sync,
    })
  end
end

null_ls.setup {
  sources = sources,
  on_attach = on_attach,
}

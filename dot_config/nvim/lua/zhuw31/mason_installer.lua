local ok, installer = pcall(require, 'mason-tool-installer')

if not ok then
  return
end

installer.setup {
  ensure_installed = {
    'eslint_d',
    'stylua',
    'prettierd',
  },
  auto_update = true,
}

-- run :PackerCompile whenever plugins.lua is updated
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]

local augroup_clear = { clear = true }
-- Highlight when yank
vim.api.nvim_create_augroup('YankHighlight', augroup_clear)
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = 'YankHighlight',
  pattern = '*',
})

-- windows to close with "q"
vim.api.nvim_create_augroup('QuickCloseQ', augroup_clear)
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'help', 'startuptime', 'lspinfo', 'qf' },
  group = 'QuickCloseQ',
  callback = function()
    vim.keymap.set('n', 'q', '<cmd>close<CR>', { silent = true })
  end,
})

-- cmd [[autocmd BufWritePost ~/.local/share/chezmoi/* !chezmoi apply --source-path "%"]]
vim.api.nvim_create_augroup('ChezmoiApply', augroup_clear)
vim.api.nvim_create_autocmd('BufWritePost', {
  ---@diagnostic disable-next-line: missing-parameter
  pattern = vim.fn.expand '~/.local/share/chezmoi/' .. '*',
  group = 'ChezmoiApply',
  callback = function(opts)
    os.execute('chezmoi apply --source-path ' .. opts.file)
  end,
})

vim.api.nvim_create_autocmd('User', {
  pattern = 'MasonToolsUpdateCompleted',
  callback = function()
    vim.schedule(function()
      print 'mason-tool-installer has finished'
    end)
  end,
})

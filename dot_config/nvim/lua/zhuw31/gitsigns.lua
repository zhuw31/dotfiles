local ok, gitsigns = pcall(require, 'gitsigns')
if not ok then
  return
end

gitsigns.setup {
  preview_config = {
    border = 'rounded',
  },
  on_attach = function(bufnr)
    local opt = { buffer = bufnr }
    vim.keymap.set('n', '[c', gitsigns.prev_hunk, opt)
    vim.keymap.set('n', ']c', gitsigns.next_hunk, opt)
    vim.keymap.set('n', '<leader>hp', gitsigns.preview_hunk, opt)
    vim.keymap.set('n', '<leader>hr', gitsigns.reset_hunk, opt)
    vim.keymap.set('n', '<leader>hb', function()
      gitsigns.blame_line { full = true }
    end, opt)
  end,
}

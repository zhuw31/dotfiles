local M = {}

function M.setup()
  local gitsigns = require 'gitsigns'

  gitsigns.setup {
    current_line_blame = true,
    signs = {
      add = { hl = 'GitSignsAdd', text = '▌' },
      change = { hl = 'GitSignsChange', text = '▌' },
      delete = { hl = 'GitSignsDelete', text = '▌' },
      topdelete = { hl = 'GitSignsDelete', text = '▌' },
      changedelete = { hl = 'GitSignsChange', text = '▌' },
    },
    on_attach = function(bufnr)
      vim.keymap.set('n', '[c', gitsigns.prev_hunk, { buffer = bufnr })
      vim.keymap.set('n', ']c', gitsigns.next_hunk, { buffer = bufnr })
      vim.keymap.set('n', '<leader>hp', gitsigns.preview_hunk, { buffer = bufnr })
      vim.keymap.set('n', '<leader>hr', gitsigns.reset_hunk, { buffer = bufnr })
    end,
  }
end

return M

local opts = { silent = true, noremap = true }
local function n_map(key, cmd)
  return vim.api.nvim_set_keymap('n', key, cmd, opts)
end

n_map('[b', '<cmd>BufferLineCyclePrev<CR>')
n_map(']b', '<cmd>BufferLineCycleNext<CR>')

require('bufferline').setup {
  options = {
    show_close_icon = true,
    show_buffer_close_icons = false,
    diagnostics = 'nvim_lsp',
    always_show_bufferline = false,
    separator_style = 'thick',
    offsets = {
      {
        filetype = 'NvimTree',
        text = 'NvimTree',
        highlight = 'Directory',
        text_align = 'left',
      },
    },
  },
}

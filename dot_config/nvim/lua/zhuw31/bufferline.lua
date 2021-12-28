local status_ok, bufferline = pcall(require, 'bufferline')
if not status_ok then
  return
end

local utils = require 'zhuw31.utils'

utils.n_map('[b', '<cmd>BufferLineCyclePrev<CR>')
utils.n_map(']b', '<cmd>BufferLineCycleNext<CR>')

bufferline.setup {
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

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

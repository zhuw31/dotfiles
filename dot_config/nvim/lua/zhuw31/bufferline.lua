local status_ok, bufferline = pcall(require, 'bufferline')
if not status_ok then
  return
end

vim.keymap.set('n', '<S-h>', ':BufferLineCyclePrev<CR>')
vim.keymap.set('n', '<S-l>', ':BufferLineCycleNext<CR>')

bufferline.setup {
  options = {
    show_close_icon = true,
    show_buffer_close_icons = false,
    diagnostics = 'nvim_lsp',
    always_show_bufferline = true,
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

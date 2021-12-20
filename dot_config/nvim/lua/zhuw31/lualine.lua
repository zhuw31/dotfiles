require('lualine').setup {
  options = {
    section_separators = { left = '', right = ''},
    component_separators = { left = '', right = ''},
    disabled_filetypes = { 'NvimTree' }
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'filename', 'branch' },
    lualine_c = { 'diff', 'diagnostics' },
    lualine_x = {
      'encoding',
      'filetype',
    },
    lualine_y = { 'location', 'progress' },
    lualine_z = { "os.date('%H:%M:%S')" },
  },
  tabline = {
    lualine_a = { 'filename' },
  },
}

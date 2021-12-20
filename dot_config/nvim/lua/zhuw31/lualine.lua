require('lualine').setup {
  options = {
    theme = 'nord',
    section_separators = '',
    component_separators = '',
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'filename', 'branch' },
    lualine_c = { 'diff', 'g:coc_status' },
    lualine_x = {
      'fileformat',
      { 'o:encoding', upper = true },
    },
    lualine_y = { 'filetype' },
    lualine_z = { 'location', 'progress' },
  },
  tabline = {
    lualine_a = { 'filename' },
  },
}

local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
  return
end

local spaces = function()
  return 'spaces: ' .. vim.api.nvim_buf_get_option(0, 'shiftwidth')
end

lualine.setup {
  options = {
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    disabled_filetypes = { 'NvimTree' },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'filename', 'branch' },
    lualine_c = { 'diff', 'diagnostics' },
    lualine_x = { 'encoding', 'filetype', spaces },
    lualine_y = { 'location', 'progress' },
    lualine_z = { "os.date('%H:%M:%S')" },
  },
}

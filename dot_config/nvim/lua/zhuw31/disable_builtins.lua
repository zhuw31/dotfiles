-- Disable some built-in plugins we don't want
local disabled_built_ins = {
  'getscript',
  'getscriptPlugin',
  'vimball',
  'vimballPlugin',
  '2html_plugin',

  'matchit',
  'matchparen',
  'logiPat',
  'rrhelper',

  'gzip',
  'zipPlugin',
  'zip',
  'tarPlugin',
  'tar',

  'netrw',
  'netrwPlugin',
  'netrwSettings',
}
for _, builtin in pairs(disabled_built_ins) do
  vim.g['loaded_' .. builtin] = 1
end

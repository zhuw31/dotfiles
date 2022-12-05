local ok, ls = pcall(require, 'luasnip')
if not ok then
  return
end

require('luasnip.loaders.from_lua').load { paths = '~/.config/nvim/snippets' }
local types = require 'luasnip.util.types'

ls.config.setup {
  -- This one is cool cause if you have dynamic snippets, it updates as you type!
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { '●' } },
        priority = 0,
      },
    },
  },
  update_events = 'TextChanged,TextChangedI',
  load_ft_func = require('luasnip.extras.filetype_functions').extend_load_ft {},
}

ls.filetype_extend('typescript', { 'javascript' })
ls.filetype_extend('typescriptreact', { 'javascript' })
ls.filetype_extend('javascriptreact', { 'javascript' })

vim.keymap.set({ 'i', 's' }, '<c-k>', function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end)

vim.keymap.set({ 'i', 's' }, '<c-j>', function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end)

vim.keymap.set('i', '<c-l>', function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

local ok, ls = pcall(require, 'luasnip')
if not ok then
  return
end

local types = require 'luasnip.util.types'

ls.config.setup {
  -- This tells LuaSnip to remember to keep around the last snippet.
  -- You can jump back into it even if you move outside of the selection
  history = true,

  -- This one is cool cause if you have dynamic snippets, it updates as you type!
  update_events = 'TextChanged,TextChangedI',

  -- Autosnippets:
  enable_autosnippets = true,
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { '', 'Comment' } },
      },
    },
  },
}

local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node

ls.add_snippets('typescript', {
  s('clg', {
    t 'console.',
    c(1, {
      t 'log',
      t 'dir',
      t 'error',
    }),
    t '(',
    i(2, { 'msg' }),
    t ')',
  }),
})

-- <c-l> is selecting within a list of options.
-- This is useful for choice nodes (introduced in the forthcoming episode 2)
vim.keymap.set('i', '<c-l>', function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

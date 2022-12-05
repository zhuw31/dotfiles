local ok, ls = pcall(require, 'luasnip')
if not ok then
  return
end

local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node

local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep
local types = require 'luasnip.util.types'

ls.config.setup {
  -- This one is cool cause if you have dynamic snippets, it updates as you type!
  update_events = 'TextChanged,TextChangedI',
}

ls.add_snippets('typescript', {
  s(
    'clg',
    fmt(
      [[
        console.log({{
          {}
        }})
      ]],
      {
        i(1, 'var'),
      }
    )
  ),
  s(
    'iff',
    fmt(
      [[
    if ({}) {{
      {}
    }}
    ]],
      {
        i(1, 'condition'),
        i(2, '// TODO:'),
      }
    )
  ),
  s(
    'us',
    fmt([[const [{}, {}] = useState{}({})]], {
      i(1),
      f(function(args)
        local getter = args[1][1]
        return 'set' .. getter:sub(1, 1):upper() .. getter:sub(2)
      end, { 1 }),
      i(2),
      i(3),
    })
  ),
  s(
    'ue',
    fmt(
      [[
    useEffect(() => {{
      {}
    }}, [{}])
    ]],
      {
        c(2, {
          t '// TODO:',
          fmt(
            [[
          async function {}() {{
            {}
          }}

          {}()
          ]],
            {
              i(1),
              i(2, '// TODO:'),
              rep(1),
            }
          ),
        }),
        i(1, 'dep'),
      }
    )
  ),
  s(
    'de',
    fmt(
      [[
    describe{}("{}", () => {{
      {}
    }})
    ]],
      {
        c(1, {
          t '',
          t '.concurrent',
        }),
        i(2),
        i(3, '// TODO:'),
      }
    )
  ),
  s(
    'te',
    fmt(
      [[
      test("{}", {}() => {{
        {}
      }})
      ]],
      {
        i(1),
        c(2, {
          t '',
          t 'async ',
        }),
        i(3, '// TODO:'),
      }
    )
  ),
})

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

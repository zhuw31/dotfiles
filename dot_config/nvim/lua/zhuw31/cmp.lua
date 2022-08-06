local ok, cmp = pcall(require, 'cmp')
local ok_ls, ls = pcall(require, 'luasnip')
if not ok or not ok_ls then
  return
end

local kind_icons = {
  Text = '',
  Method = '',
  Function = '',
  Constructor = '',
  Field = '',
  Variable = '',
  Class = 'ﴯ',
  Interface = '',
  Module = '',
  Property = 'ﰠ',
  Unit = '',
  Value = '',
  Enum = '',
  Keyword = '',
  Snippet = '',
  Color = '',
  File = '',
  Reference = '',
  Folder = '',
  EnumMember = '',
  Constant = '',
  Struct = '',
  Event = '',
  Operator = '',
  TypeParameter = '',
}

cmp.setup {
  fields = { 'kind', 'abbr', 'menu' },
  snippet = {
    expand = function(args)
      ls.lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<TAB>'] = cmp.mapping(function(fallback)
      if ls.expand_or_jumpable() then
        ls.expand_or_jump()
      elseif cmp.visible() then
        cmp.confirm {
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        }
      else
        fallback()
      end
    end),
    ['<S-TAB>'] = cmp.mapping(function(fallback)
      if ls.jumpable(-1) then
        ls.jump(-1)
      else
        fallback()
      end
    end),
  },
  sources = cmp.config.sources {
    { name = 'nvim_lua' },
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'luasnip' },
    { name = 'buffer', keyword_length = 3 },
    { name = 'nvim_lsp_signature_help' },
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = kind_icons[vim_item.kind] -- This concatonates the icons with the name of the item kind
      vim_item.menu = ({
        nvim_lsp = '[LSP]',
        nvim_lua = '[Lua]',
        path = '[Path]',
        luasnip = '[Snippet]',
        buffer = '[Buffer]',
      })[entry.source.name]
      return vim_item
    end,
  },
}
-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' },
  },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
  }, {
    { name = 'cmdline' },
  }),
})

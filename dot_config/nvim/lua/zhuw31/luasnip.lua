if vim.g.snippets ~= 'luasnip' or not pcall(require, 'luasnip') then
  return
end

local ls = require 'luasnip'

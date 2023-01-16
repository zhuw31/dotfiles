return {
  -- snippets
  {
    "L3MON4D3/LuaSnip",
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
    -- stylua: ignore
    keys = {
      {
        "<C-j>",
        function()
          local ls = require("luasinp")
          if ls.jumpable(-1) then
            ls.jump(-1)
          end
        end,
        silent = true,
        mode = { "i", "s" },
      },
      {
        "<C-k>",
        function()
          local ls = require("luasinp")
          if ls.expand_or_jumpable() then
            ls.expand_or_jump()
          end
        end,
        mode = { "s", "i" },
        silent = true,
      },
      {
        "<C-l>",
        function()
          local ls = require("luasinp")
          if ls.choice_active() then
            ls.change_choice(1)
          end
        end,
        mode = "i",
      },
    },
  },
}

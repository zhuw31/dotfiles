return {

  -- comment
  { "JoosepAlviste/nvim-ts-context-commentstring" },
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    dependencies = {
    },
    opts = {
      hooks = {
        pre = function()
          ---@diagnostic disable-next-line
          require('ts_context_commentstring.internal').update_commentstring()
        end,
      },
    },
    config = function(_, opts)
      require("mini.comment").setup(opts)
    end,
  },

  -- pairs
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    config = function(_, opts)
      require("mini.pairs").setup(opts)
    end,
  },

  -- surround
  {
    "echasnovski/mini.surround",
    keys = { "s" },
    config = function(_, opts)
      require("mini.surround").setup(opts)
    end,
  },
}

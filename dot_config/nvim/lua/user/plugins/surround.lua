return {
  -- surround
  {
    "echasnovski/mini.surround",
    keys = { "s" },
    config = function(_, opts)
      require("mini.surround").setup(opts)
    end,
  },
}

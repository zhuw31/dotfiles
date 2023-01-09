return {
  -- catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    priority = 1000,
    config = function()
      require('catppuccin').setup({
        flavour = 'frappe',
      })
    end,
  },
}

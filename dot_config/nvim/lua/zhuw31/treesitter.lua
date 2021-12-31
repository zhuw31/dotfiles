local configs = require 'nvim-treesitter.configs'

configs.setup {
  ensure_installed = 'maintained',
  highlight = {
    enable = true,
  },
  matchup = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
  },
}

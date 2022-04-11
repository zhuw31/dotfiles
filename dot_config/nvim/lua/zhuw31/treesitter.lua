local configs = require 'nvim-treesitter.configs'

configs.setup {
  ensure_installed = {
    'bash',
    'css',
    'dockerfile',
    'fish',
    'go',
    'graphql',
    'html',
    'javascript',
    'jsonc',
    'lua',
    'python',
    'rust',
    'toml',
    'tsx',
    'typescript',
    'vue',
    'yaml',
  },
  highlight = {
    enable = true,
  },
  matchup = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
  },
}

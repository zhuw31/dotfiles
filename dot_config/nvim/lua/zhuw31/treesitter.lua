local M = {}

function M.setup()
  local configs = require 'nvim-treesitter.configs'

  configs.setup {
    ensure_installed = {
      'c',
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
    indent = {
      enable = true,
    },
    highlight = {
      enable = true,
    },
    matchup = {
      enable = true,
    },
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
  }
end

return M

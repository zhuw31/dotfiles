return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = 'BufReadPost',
    dependencies = {
      'windwp/nvim-ts-autotag',
    },
    ---@type TSConfig
    opts = {
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      context_commentstring = { enable = true, enable_autocmd = false },
      autotag = { enable = true },
      ensure_installed = {
        'bash',
        'css',
        'dart',
        'dockerfile',
        'fish',
        'gitcommit',
        'gitignore',
        'go',
        'help',
        'html',
        'javascript',
        'jsdoc',
        'json',
        'json5',
        'jsonc',
        'lua',
        'markdown',
        'markdown_inline',
        'pug',
        'python',
        'rust',
        'scss',
        'toml',
        'tsx',
        'typescript',
        'vim',
        'vue',
        'yaml',
      },
    },
    ---@param opts TSConfig
    config = function(plugin, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
}

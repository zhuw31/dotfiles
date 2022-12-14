local fn = vim.fn

local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

local packer_bootstrap
---@diagnostic disable-next-line: missing-parameter
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
  vim.cmd [[packadd packer.nvim]]
end

local packer = require 'packer'

packer.startup {
  function(use)
    use 'lewis6991/impatient.nvim'
    use 'wbthomason/packer.nvim'
    use 'dstein64/vim-startuptime'
    use { 'catppuccin/nvim', as = 'catppuccin' }
    use {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
    }
    use {
      'nvim-telescope/telescope.nvim',
      requires = { 'nvim-telescope/telescope-fzy-native.nvim', run = 'make' },
      keys = { '<leader>ff' },
      config = function()
        require 'zhuw31.telescope'
      end,
    }
    use {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      {
        'neovim/nvim-lspconfig',
        config = function()
          require 'zhuw31.lsp'
        end,
      },
      'glepnir/lspsaga.nvim',
      'jose-elias-alvarez/typescript.nvim',
      'jose-elias-alvarez/null-ls.nvim',
      'b0o/schemastore.nvim',
    }
    use {
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      {
        'L3MON4D3/LuaSnip',
        event = 'InsertCharPre',
        config = function()
          require 'zhuw31.luasnip'
        end,
      },
    }
    use 'kyazdani42/nvim-web-devicons'
    use {
      'hoob3rt/lualine.nvim',
      event = 'VimEnter',
      config = function()
        require 'zhuw31.lualine'
      end,
    }
    use 'gpanders/editorconfig.nvim'
    use {
      { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
      'nvim-treesitter/nvim-treesitter-textobjects',
      'JoosepAlviste/nvim-ts-context-commentstring',
    }
    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag'
    use 'numToStr/Comment.nvim'
    use 'kylechui/nvim-surround'
    use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install' }
    use 'mzlogin/vim-markdown-toc'
    use {
      'kyazdani42/nvim-tree.lua',
      keys = '<leader>e',
      config = function()
        require 'zhuw31.nvimtree'
      end,
    }
    use 'lewis6991/gitsigns.nvim'
    use 'akinsho/toggleterm.nvim'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
      packer.sync()
    end
  end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float { border = 'single' }
      end,
    },
  },
}

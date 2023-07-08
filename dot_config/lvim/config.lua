--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]

-- luacheck: globals vim lvim
-- luacheck: no max line length

-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true
vim.opt.cmdheight = 1

-- general
lvim.log.level = "info"
lvim.format_on_save = {
  enabled = true,
  timeout = 2000,
}
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
-- lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

lvim.keys.normal_mode["<s-h>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<s-l>"] = ":BufferLineCyclePrev<CR>"

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["t"] = {
  name = "Typescript",
  a = { "<cmd>TypescriptAddMissingImports<cr>", "TypescriptAddMissingImports" },
  o = { "<cmd>TypescriptOrganizeImports<cr>", "TypescriptOrganizeImports" },
  u = { "<cmd>TypescriptRemoveUnused<cr>", "TypescriptRemoveUnused" },
  f = { "<cmd>TypescriptFixAll<cr>", "TypescriptFixAll" },
  r = { "<cmd>TypescriptRenameFile<cr>", "TypescriptRenameFile" },
  g = { "<cmd>TypescriptGoToSourceDefinition<cr>", "TypescriptGoToSourceDefinition" },
}

-- Change theme settings
lvim.colorscheme = "catppuccin"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true

lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "fzf")
  -- any other extensions loading
end

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

-- lvim.builtin.treesitter.ignore_install = { "haskell" }

-- -- always installed on startup, useful for parsers without a strict filetype
-- lvim.builtin.treesitter.ensure_installed = { "comment", "markdown_inline", "regex" }

-- -- generic LSP settings <https://www.lunarvim.org/docs/configuration/language-features/language-servers>

-- --- disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
local lvim_lsp = require("lvim.lsp")
local ts = require("typescript")
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "tsserver", "bashls" })
local common_on_attach = lvim_lsp.common_on_attach
local common_capabilities = lvim_lsp.common_capabilities()
-- Typescript config using typescript.nvim
ts.setup({
  server = {
    root_dir = require("lspconfig.util").root_pattern(".git"),
    capabilities = common_capabilities,
    on_attach = common_on_attach,
  },
})

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- linters, formatters and code actions <https://www.lunarvim.org/docs/configuration/language-features/linting-and-formatting>
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  { name = "stylua" },
  { name = "prettierd" },
  { name = "shfmt" },
  { name = "goimports" },
  { name = "black" },
})
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
  { name = "flake8", filetypes = { "python" } },
  { name = "eslint_d" },
  { name = "luacheck" },
})
local code_actions = require("lvim.lsp.null-ls.code_actions")
code_actions.setup({
  { name = "eslint_d" },
})

-- -- Additional Plugins <https://www.lunarvim.org/docs/configuration/plugins/user-plugins>
lvim.plugins = {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    init = function()
      require("catppuccin").setup({
        flavour = "frappe",
      })
    end,
  },
  {
    "jose-elias-alvarez/typescript.nvim",
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
  { "folke/zen-mode.nvim" },
}

lvim.autocommands = {
  {
    "BufWritePre",
    {
      pattern = { "*.tsx", "*.ts" },
      callback = function()
        require("typescript").actions.organizeImports({ sync = true })
      end,
    },
  },
}

-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })

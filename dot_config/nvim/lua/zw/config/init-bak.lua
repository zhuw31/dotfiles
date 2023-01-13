local M = {}

local kinds = {
  Class = "",
  Color = "",
  Constant = "",
  Constructor = "",
  Enum = "",
  EnumMember = "",
  Event = "",
  Field = "",
  File = "",
  Folder = "",
  Function = "",
  Interface = "",
  Keyword = "",
  Method = "",
  Module = "",
  Operator = "",
  Property = "",
  Reference = "",
  Snippet = "",
  Struct = "",
  Text = "",
  TypeParameter = "",
  Unit = "",
  Value = "",
  Variable = "",
}

local options = {
  -- icons used by other plugins
  icons = {
    cmp_kinds = M.kinds,
    diagnostics = { Error = " ", Warn = " ", Hint = " ", Info = " " },
    git = { added = " ", changed = " ", removed = " " },
  },
  -- cli tools
  ms_install = {
    -- diagnostic
    "eslint_d",
    "flake8",
    "markdownlint",
    "shellcheck",
    -- format
    "black",
    "isort",
    "prettierd",
    "shfmt",
    "stylua",
  },
  -- treesitter parsers
  ts_install = {
    "bash",
    "css",
    "dart",
    "dockerfile",
    "fish",
    "gitcommit",
    "gitignore",
    "go",
    "help",
    "html",
    "javascript",
    "jscod",
    "json",
    "json5",
    "jsonc",
    "lua",
    "markdown",
    "markdown_inline",
    "pug",
    "python",
    "rust",
    "scss",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "vue",
    "yaml",
  },
  servers = {
    bashls = {},
    cssls = {},
    dockerls = {},
    html = {},
    jsonls = {},
    marksman = {},
    sumneko_lua = {
      settings = {
        Lua = {
          workspace = {
            checkThirdParty = false 
          },
          telemetry = {
            enable = false,
          },
          diagnostics = {
            globals = {'vim'},
          },
        },
      },
    },
    tailwindcss = {},
    taplo = {},
    tsserver = {},
  },
}

setmetatable(M, {
  __index = function(_, key)
    return options[key]
  end,
})

return M

return {
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
      { "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "b0o/SchemaStore.nvim",
      "jose-elias-alvarez/typescript.nvim",
    },
    ---@class PluginLspOpts
    opts = {
      servers = {
        bashls = {},
        cssls = {},
        dockerls = {},
        html = {},
        jsonls = {
          -- lazy-load schemastore when needed
          on_new_config = function(new_config)
            new_config.settings.json.schemas = new_config.settings.json.schemas or {}
            ---@diagnostic disable-next-line
            vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
          end,
          settings = {
            json = {
              validate = { enable = true },
            },
          },
        },
        marksman = {},
        sumneko_lua = {
          single_file_support = true,
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              telemetry = {
                enable = false,
              },
              diagnostics = {
                globals = { "vim" },
              },
            },
          },
        },
        tailwindcss = {},
        taplo = {},
        tsserver = {},
        yamlls = {},
      },
      setup = {
        tsserver = function(_, opts)
          require("zw.util").on_attach(function(client, buffer)
            if client.name == "tsserver" then
              vim.keymap.set(
                "n",
                "<leader>co",
                "TypescriptOrganizeImports",
                { buffer = buffer, desc = "Organize Imports" }
              )
            end
          end)
          require("typescript").setup({ server = opts })
          return true
        end,
      },
    },
    ---@param opts PluginLspOpts
    config = function(_, opts)
      -- setup formatting and keymaps
      require("zw.util").on_attach(function(client, buffer)
        require("zw.plugins.lsp.format").on_attach(client, buffer)
        require("zw.plugins.lsp.keymaps").on_attach(client, buffer)
      end)

      -- diagnostics
      for name, icon in pairs(require("zw.config").icons.diagnostics) do
        name = "DiagnosticSign" .. name
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
      end
      vim.diagnostic.config({
        underline = true,
        update_in_insert = false,
        virtual_text = false,
        severity_sort = true,
      })

      local servers = opts.servers
      local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

      require("mason-lspconfig").setup({ ensure_installed = vim.tbl_keys(servers) })
      require("mason-lspconfig").setup_handlers({
        function(server)
          local server_opts = servers[server] or {}
          server_opts.capabilities = capabilities
          if opts.setup[server] then
            if opts.setup[server](server, server_opts) then
              return
            end
          elseif opts.setup["*"] then
            if opts.setup["*"](server, server_opts) then
              return
            end
          end
          require("lspconfig")[server].setup(server_opts)
        end,
      })
    end,
  },

  -- formatters
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    dependencies = { "mason.nvim" },
    opts = function()
      local nb = require("null-ls").builtins
      return {
        sources = {
          -- diagnostic
          nb.diagnostics.eslint_d,
          nb.diagnostics.flake8,
          nb.diagnostics.markdownlint,
          nb.diagnostics.shellcheck,
          -- format
          nb.formatting.black,
          nb.formatting.isort,
          nb.formatting.prettierd,
          nb.formatting.shfmt,
          nb.formatting.stylua,
        },
      }
    end,
  },

  -- cmdline tools and lsp servers
  {

    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    opts = {
      ensure_installed = {
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
    },
    ---@param opts MasonSettings | {ensure_installed: string[]}
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      for _, tool in ipairs(opts.ensure_installed) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end,
  },
}

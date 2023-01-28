return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "jose-elias-alvarez/typescript.nvim" },
    opts = {
      -- make sure mason installs the server
      servers = {
        tsserver = {},
      },
      setup = {
        tsserver = function(_, opts)
          require("zw.util").on_attach(function(client, buffer)
            if client.name == "tsserver" then
              vim.keymap.set(
                "n",
                "<leader>to",
                ":TypescriptOrganizeImports<cr>",
                { buffer = buffer, desc = "[T]ypescript [O]rganize Imports" }
              )
              vim.keymap.set(
                "n",
                "<leader>ta",
                ":TypescriptAddMissingImports<cr>",
                { buffer = buffer, desc = "[T]ypescript [A]dd Missing Imports" }
              )
              vim.keymap.set(
                "n",
                "<leader>tr",
                ":TypescriptRemoveUnused<cr>",
                { buffer = buffer, desc = "[T]ypescript [R]emove Unused" }
              )
              vim.keymap.set(
                "n",
                "gd",
                ":TypescriptGoToSourceDefinition<cr>",
                { buffer = buffer, desc = "[T]ypescript [G]o To Source Definition" }
              )
            end
          end)
          require("typescript").setup({ server = opts })
          return true
        end,
      },
    },
  },
}

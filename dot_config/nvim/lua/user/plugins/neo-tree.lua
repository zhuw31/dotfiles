return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<CR>", desc = "Toggle [F]ile [T]ree" },
    },
    opts = {
      filesystem = {
        follow_current_file = true,
      },
      window = {
        mappings = {
          ['o'] = "open",
        }
      }
    },
    init = function()
      vim.g.neo_tree_remove_legacy_commands = 1
    end,
  }
}

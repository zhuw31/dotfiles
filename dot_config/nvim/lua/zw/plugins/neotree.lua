return {
  -- file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<CR>", desc = "Explorer NeoTree (root dir)" },
    },
    init = function()
      vim.g.neo_tree_remove_legacy_commands = 1
    end,
    opts = {
      filesystem = {
        follow_current_file = true,
        filtered_items = {
          visible = true,
        }
      },
      window = {
        mappings = {
          ['o'] = "open"
        }
      }
    },
  },
}

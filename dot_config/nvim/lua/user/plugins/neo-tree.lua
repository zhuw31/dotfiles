return {
  {
	  "nvim-neo-tree/neo-tree.nvim",
	  cmd = "Neotree",
	  dependencies = { 
		  "nvim-lua/plenary.nvim",
		  "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		  "MunifTanjim/nui.nvim",
	  },
	  keys = {
		  { "<leader>ft", "<cmd>Neotree toggle<CR>", desc = "Toggle [F]ile [T]ree" },
	  },
	  opts = {
		  filesystem = {
			  visible = true,
			  follow_current_file = true,
		  },
	  },
	  init = function()
		  vim.g.neo_tree_remove_legacy_commands = 1
	  end,
  }
}

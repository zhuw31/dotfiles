return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false, -- telescope did only one release, so use HEAD for now
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = {
      { '<leader>?', "<cmd>Telescope oldfiles<cr>", { desc = '[?] Find recently opened files' }},
      { '<leader><space>', "<cmd>Telescope buffers<cr>", { desc = '[ ] Find existing buffers' }},
      { '<leader>/', "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = '[/] Fuzzily search in current buffer]' }},
      { '<leader>sf', "<cmd>Telescope find_files<cr>", { desc = '[S]earch [F]iles' }},
      { '<leader>sh', "<cmd>Telescope help_tags<cr>", { desc = '[S]earch [H]elp' }},
      { '<leader>sw', "<cmd>Telescope grep_string<cr>", { desc = '[S]earch current [W]ord' }},
      { '<leader>sg', "<cmd>Telescope live_grep<cr>", { desc = '[S]earch by [G]rep' }},
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("fzf")
    end,
  }
}

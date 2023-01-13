local Util = require('zw.util')
return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false, -- telescope did only one release, so use HEAD for now
    keys = {
      { "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "[,] Show All Buffers" },
      { "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "[/] Current Buffer" },
      { "<leader>fF", Util.telescope("files", { cwd = false }), desc = "[F]ind [F]iles (cwd)" },
      { "<leader>ff", Util.telescope("files"), desc = "[F]ind [F]iles (root dir)" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "[F]ind [B]uffers" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "[F]ind [R]ecent" },
      { "<leader>fG", Util.telescope("live_grep", { cwd = false }), desc = "[F]ind [G]rep (cwd)" },
      { "<leader>fg", Util.telescope("live_grep"), desc = "Grep (root dir)" },
      { "<leader>fM", "<cmd>Telescope man_pages<cr>", desc = "[F]ind [M]an Pages" },
      { "<leader>fa", "<cmd>Telescope autocommands<cr>", desc = "[F]ind [A]uto Commands" },
      { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "[:] Command History" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "[F]ind [H]elp Pages" },
      { "<leader>fH", "<cmd>Telescope highlights<cr>", desc = "[F]ind [H]ighlight Groups" },
      { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "[F]ind [K]ey Maps" },
      { "<leader>fm", "<cmd>Telescope marks<cr>", desc = "[F]ind [M]arks" },
      { "<leader>fo", "<cmd>Telescope vim_options<cr>", desc = "[F]ind vim [O]ptions" },
    },
    init = function()
      if vim.fn.argc() == 1 then
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then
          Util.telescope("files")
        end
      end
    end,
  },
}

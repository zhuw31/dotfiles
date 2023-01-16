return {
  -- git signs
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      preview_config = { border = "rounded" },
      on_attach = function(buffer)
        local gs = require("gitsigns")

        vim.keymap.set("n", "]c", function()
          if vim.wo.diff then
            return "]c"
          end
          vim.schedule(gs.next_hunk)
          return "<Ignore>"
        end, {
          expr = true,
          buffer = buffer,
        })

        vim.keymap.set("n", "[c", function()
          if vim.wo.diff then
            return "[c"
          end
          vim.schedule(gs.prev_hunk)
          return "<Ignore>"
        end, {
          expr = true,
          buffer = buffer,
        })

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        map({ "n", "v" }, "<leader>hs", gs.stage_hunk, "Stage Hunk")
        map({ "n", "v" }, "<leader>hr", gs.reset_hunk, "Reset Hunk")
        map("n", "<leader>hS", gs.stage_buffer, "Stage Buffer")
        map("n", "<leader>hR", gs.reset_buffer, "Reset Buffer")
        map("n", "<leader>hp", gs.preview_hunk, "Preview Hunk")
        map("n", "<leader>hb", function()
          gs.blame_line({ full = true })
        end, "Blame Line")
      end,
    },
    event = "BufReadPre",
  },
}

return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    opts = {
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, { expr = true, desc = 'Next Hunk' })

        map('n', '[c', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, { expr = true, desc = 'Prev Hunk' })

        -- Actions
        map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>', { desc = "[S]tage Hunk" })
        map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>', { desc = "[R]eset Hunk" })
        map('n', '<leader>hS', gs.stage_buffer, { desc = "[S]tage Buffer" })
        map('n', '<leader>hu', gs.undo_stage_hunk, { desc = "[U]ndo Stage Hunk" })
        map('n', '<leader>hR', gs.reset_buffer, { desc = "[R]eset Buffer" })
        map('n', '<leader>hp', gs.preview_hunk, { desc = "[P]review Hunk" })
        map('n', '<leader>hb', function() gs.blame_line{full=true} end, { desc = "[B]lame" })
        map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = "[T]oggle [B]lame" })
        map('n', '<leader>hd', gs.diffthis, { desc = "[D]iff this" })
        map('n', '<leader>hD', function() gs.diffthis('~') end, { desc = "[D]iff this ~" })
        map('n', '<leader>td', gs.toggle_deleted, { desc = "[T]oggle [D]elete" })
      end,
    },
  },
}

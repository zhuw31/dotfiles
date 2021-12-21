require("toggleterm").setup {
    float_opts = {
        width = vim.o.columns * 0.9,
        height = vim.o.rows * 0.9
    }
}
local Terminal  = require('toggleterm.terminal').Terminal

local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  -- function to run on opening the terminal
  on_open = function(term)
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  end,
})

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})

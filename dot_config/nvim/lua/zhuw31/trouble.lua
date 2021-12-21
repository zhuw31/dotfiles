require("trouble").setup {}

local opts = { silent = true, noremap = true }
local function n_map(key, cmd)
    return vim.api.nvim_set_keymap('n', key, cmd, opts)
end

n_map("<leader>tw", "<cmd>Trouble workspace_diagnostics<cr>")
n_map("gd", "<cmd>Trouble lsp_definitions<cr>")
n_map("<leader>D", "<cmd>Trouble lsp_type_definitions<cr>")
n_map("gi", "<cmd>Trouble lsp_implementations<cr>")
n_map("gr", "<cmd>Trouble lsp_references<cr>")

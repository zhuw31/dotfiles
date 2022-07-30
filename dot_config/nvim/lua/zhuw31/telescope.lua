local M = {}

function M.setup()
  local telescope = require 'telescope'
  local actions = require 'telescope.actions'
  local actions_layout = require 'telescope.actions.layout'
  local builtins = require 'telescope.builtin'
  local previewers = require 'telescope.previewers'

  local opts = { silent = true }
  vim.keymap.set('n', '<leader>ff', builtins.find_files, opts)
  vim.keymap.set('n', '<leader>fl', builtins.live_grep, opts)
  vim.keymap.set('n', '<leader>fb', builtins.buffers, opts)
  vim.keymap.set('n', '<leader>fh', builtins.help_tags, opts)
  vim.keymap.set('n', '<leader>fk', builtins.keymaps, opts)
  vim.keymap.set('n', '<leader>fs', function()
    builtins.grep_string { search = vim.fn.input 'Grep for > ' }
  end, opts)
  vim.keymap.set('n', '<leader>fc', builtins.current_buffer_fuzzy_find, opts)

  telescope.setup {
    defaults = {
      layout_strategy = 'flex',
      scroll_strategy = 'cycle',
      selection_strategy = 'reset',
      winblend = 0,
      layout_config = {
        vertical = {
          mirror = true,
        },
        center = {
          mirror = true,
        },
      },
      hl_result_eol = false,
      file_previewer = previewers.vim_buffer_cat.new,
      grep_previewer = previewers.vim_buffer_vimgrep.new,
      qflist_previewer = previewers.vim_buffer_qflist.new,
      mappings = {
        i = {
          ['<C-s>'] = actions.cycle_previewers_next,
          ['<C-a>'] = actions.cycle_previewers_prev,

          ['<C-Down>'] = actions.cycle_history_next,
          ['<C-Up>'] = actions.cycle_history_prev,
          ['<C-h>'] = actions_layout.toggle_preview,

          ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
          ['<A-q>'] = false,
          ['<C-c>'] = actions.close,
        },
      },
      file_ignore_patterns = { '.git/' },
      dynamic_preview_title = true,
    },
    pickers = {
      find_files = {
        theme = 'dropdown',
        previewer = false,
      },
      file_browser = {
        theme = 'dropdown',
        previewer = false,
      },
      git_files = {
        theme = 'dropdown',
        previewer = false,
      },
      buffers = {
        sort_mru = true,
        theme = 'dropdown',
        previewer = false,
        mappings = {
          i = { ['<c-d>'] = actions.delete_buffer },
        },
      },
      lsp_references = { path_display = { 'shorten' } },
      lsp_code_actions = { theme = 'dropdown' },
      current_buffer_fuzzy_find = { theme = 'dropdown' },
    },
    extensions = {
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
      },
    },
  }

  telescope.load_extension 'fzy_native'
end

return M

local M = {}

local map = function(mode, key, cmd, opts)
  local default_opts = { silent = true, noremap = true }
  opts = vim.tbl_deep_extend('force', default_opts, opts or {})

  return vim.api.nvim_set_keymap(mode, key, cmd, opts)
end

function M.n_map(key, cmd, opts)
  return map('n', key, cmd, opts)
end

function M.v_map(key, cmd, opts)
  return map('v', key, cmd, opts)
end

function M.i_map(key, cmd, opts)
  return map('i', key, cmd, opts)
end

function M.put(...)
  local objects = {}
  for i = 1, select('#', ...) do
    local v = select(i, ...)
    table.insert(objects, vim.inspect(v))
  end

  print(table.concat(objects, '\n'))
  return ...
end

return M

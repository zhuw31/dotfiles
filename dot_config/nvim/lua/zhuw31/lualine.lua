local ok, lualine = pcall(require, 'lualine')
if not ok then
  return
end

local spaces = {
  function()
    if not vim.api.nvim_buf_get_option(0, 'expandtab') then
      return 'Tab size: ' .. vim.api.nvim_buf_get_option(0, 'tabstop') .. ' '
    end
    local size = vim.api.nvim_buf_get_option(0, 'shiftwidth')
    if size == 0 then
      size = vim.api.nvim_buf_get_option(0, 'tabstop')
    end
    return 'Spaces: ' .. size .. ' '
  end,
}

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end

local diff = {
  'diff',
  source = diff_source,
  symbols = { added = '  ', modified = '柳', removed = ' ' },
}

local encoding = {
  'o:encoding',
  fmt = string.upper,
}

local lsp = {
  function(msg)
    msg = msg or 'LS Inactive'
    local buf_clients = vim.lsp.buf_get_clients()
    local buf_client_names = {}

    -- add client
    for _, client in pairs(buf_clients) do
      if client.name ~= 'null-ls' then
        table.insert(buf_client_names, client.name)
      end
    end

    return '[' .. table.concat(buf_client_names, ', ') .. ']'
  end,
  icon = ' ',
}

local branch = {
  'branch',
  icon = '',
}

lualine.setup {
  options = {
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    disabled_filetypes = { 'NvimTree', 'TelescopePrompt', 'qf' },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'filename', branch, diff },
    lualine_c = { 'diagnostics' },
    lualine_x = { lsp },
    lualine_y = { encoding, 'filetype', spaces },
    lualine_z = { 'location', 'progress' },
  },
}

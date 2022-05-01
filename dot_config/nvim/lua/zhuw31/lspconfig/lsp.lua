local cmp_nvim_lsp_status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_nvim_lsp_status_ok then
  return
end

local ts_util_status_ok, ts_utils = pcall(require, 'nvim-lsp-ts-utils')
if not ts_util_status_ok then
  return
end

local json_sheme_status_ok, schemastore = pcall(require, 'schemastore')
if not json_sheme_status_ok then
  return
end

local lua_dev_status_ok, lua_dev = pcall(require, 'lua-dev')
if not lua_dev_status_ok then
  return
end

local lsp_installer_ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not lsp_installer_ok then
  return
end

local servers = {
  'clangd',
  'tsserver',
  'cssls',
  'html',
  'jsonls',
  'yamlls',
  'vimls',
  'sumneko_lua',
  'vuels',
  'bashls',
  'tailwindcss',
}

-- auto install listed servers
for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found and not server:is_installed() then
    print('Installing ' .. name)
    server:install()
  end
end
-- signs
local signs = {
  { name = 'DiagnosticSignError', text = '' },
  { name = 'DiagnosticSignWarn', text = '' },
  { name = 'DiagnosticSignHint', text = '' },
  { name = 'DiagnosticSignInfo', text = '' },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = '' })
end

local config = {
  virtual_text = false,
  signs = {
    active = signs,
  },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
}

vim.diagnostic.config(config)
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = 'rounded',
})
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = 'rounded',
})

local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
      false
    )
  end
end

vim.keymap.set('n', '<leader>do', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setqflist)

local function lsp_keymaps(bufnr)
  local opts = { buffer = bufnr, silent = true }

  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<leader>k', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<leader>fr', vim.lsp.buf.formatting, opts)
end

local on_attach = function(client, bufnr)
  -- disable lsp format
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false
  lsp_keymaps(bufnr)
  lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

-- ts-util
local function setup_tsserver()
  local init_options = ts_utils.init_options
  local ts_on_attach = function(client, bufnr)
    ts_utils.setup {
      auto_inlay_hints = false,
    }
    ts_utils.setup_client(client)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>or', ':TSLspOrganize<CR>', { silent = true, noremap = true })

    on_attach(client, bufnr)
  end

  return {
    init_options = init_options,
    on_attach = ts_on_attach,
    capabilities = capabilities,
  }
end

-- install all servers
lsp_installer.on_server_ready(function(server)
  local default_opts = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  local server_opts = {
    ['sumneko_lua'] = function()
      return lua_dev.setup {
        lspconfig = vim.tbl_deep_extend('force', default_opts, {}),
      }
    end,
    ['tsserver'] = function()
      default_opts = setup_tsserver()
    end,
    ['yamlls'] = function()
      return vim.tbl_deep_extend('force', default_opts, {
        settings = {
          yaml = {
            hover = true,
            completion = true,
            validate = true,
            schemas = schemastore.json.schemas(),
          },
        },
      })
    end,
    ['jsonls'] = function()
      return vim.tbl_deep_extend('force', default_opts, {
        settings = {
          json = {
            schemas = schemastore.json.schemas(),
            format = {
              enable = false,
            },
          },
        },
      })
    end,
  }

  local server_options = server_opts[server.name] and server_opts[server.name]() or default_opts
  server:setup(server_options)
end)

local lsp_installer = require 'nvim-lsp-installer'

local servers = {
  'tsserver',
  'cssls',
  'html',
  'jsonls',
  'yamlls',
  'vimls',
  'sumneko_lua',
  'vuels',
  'bashls',
}

-- auto install listed servers
for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found and not server:is_installed() then
    print('Installing ' .. name)
    server:install()
  end
end

-- null-ls
local null_ls = require 'null-ls'
local sources = {
  null_ls.builtins.formatting.prettierd,
  null_ls.builtins.formatting.stylua,
  null_ls.builtins.diagnostics.eslint_d,
  null_ls.builtins.diagnostics.stylelint.with { prefer_local = 'node_modules/.bin' },
  null_ls.builtins.code_actions.eslint_d,
}

null_ls.setup {
  sources = sources,
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd 'autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()'
    end
  end,
}

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
  update_in_insert = false,
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

local function lsp_keymaps(bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local opts = { noremap = true, silent = true }
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  -- buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<leader>k', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  -- buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  -- buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  -- buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  -- buf_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)
  lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- ts-util
local ts_utils = require 'nvim-lsp-ts-utils'
local function setup_tsserver()
  local init_options = ts_utils.init_options
  local ts_on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
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
      return require('lua-dev').setup {
        lspconfig = default_opts,
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
            schemas = require('schemastore').json.schemas(),
          },
        },
      })
    end,
    ['jsonls'] = function()
      return vim.tbl_deep_extend('force', default_opts, {
        settings = {
          json = {
            schemas = require('schemastore').json.schemas(),
          },
        },
      })
    end,
  }

  local server_options = server_opts[server.name] and server_opts[server.name]() or default_opts
  server:setup(server_options)
end)

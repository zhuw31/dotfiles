local ok, mason = pcall(require, 'mason')
local ok_lsp, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not ok or not ok_lsp then
  return
end

mason.setup()
mason_lspconfig.setup {
  automatic_installation = true,
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
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    source = 'always',
    focusable = false,
    style = 'minimal',
    border = 'rounded',
    header = '',
    prefix = '',
  },
}

vim.diagnostic.config(config)

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = 'rounded',
})
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = 'rounded',
})

local function lsp_highlight_document(client, bufnr)
  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_augroup('lsp_document_highlight', {
      clear = false,
    })
    vim.api.nvim_clear_autocmds {
      buffer = bufnr,
      group = 'lsp_document_highlight',
    }
    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
      group = 'lsp_document_highlight',
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd('CursorMoved', {
      group = 'lsp_document_highlight',
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    })
  end
end

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format {
    filter = function(client)
      -- only use null-ls to format
      return client.name == 'null-ls'
    end,
    bufnr = bufnr or 0,
  }
end

-- if you want to set up formatting on save, you can use this as a callback
local lsp_formatting_group = vim.api.nvim_create_augroup('LspFormatting', {})

local function buf_set_keymap(bufnr)
  vim.keymap.set('n', 'go', vim.diagnostic.open_float)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
  vim.keymap.set('n', '<leader>q', vim.diagnostic.setqflist)

  local opts = { buffer = bufnr, silent = true }

  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<leader>k', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', 'gk', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', 'gn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', 'gm', lsp_formatting, opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local on_attach = function(client, bufnr)
  if client.supports_method 'textDocument/formatting' then
    vim.api.nvim_clear_autocmds { group = lsp_formatting_group, buffer = bufnr }
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = lsp_formatting_group,
      buffer = bufnr,
      callback = function()
        lsp_formatting(bufnr)
      end,
    })
  end
  buf_set_keymap(bufnr)
  lsp_highlight_document(client, bufnr)
end

local servers = {
  'tsserver',
  'cssls',
  'html',
  'jsonls',
  'yamlls',
  'sumneko_lua',
  'bashls',
  'tailwindcss',
  'null-ls',
}

for _, server in ipairs(servers) do
  require('zhuw31.lspconfig.' .. server).setup(on_attach, capabilities)
end

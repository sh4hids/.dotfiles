require('mason').setup({
  ui = {
    border = 'rounded',
  },
})
require('mason-lspconfig').setup({
  ensure_installed = { 'sumneko_lua', 'tsserver', 'gopls' },
})

local status, null_ls = pcall(require, 'null-ls')
if not status then
  return
end

local lspconfig = require('lspconfig')

local with_root_file = function(...)
  local files = { ... }
  return function(utils)
    return utils.root_has_file(files)
  end
end

local buf_map = function(bufnr, mode, lhs, rhs, opts)
  vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
    silent = true,
  })
end

local on_attach = function(client, bufnr)
  vim.cmd('command! LspDef lua vim.lsp.buf.definition()')
  vim.cmd('command! LspFormatting lua vim.lsp.buf.formatting()')
  vim.cmd('command! LspCodeAction lua vim.lsp.buf.code_action()')
  vim.cmd('command! LspHover lua vim.lsp.buf.hover()')
  vim.cmd('command! LspRename lua vim.lsp.buf.rename()')
  vim.cmd('command! LspRefs lua vim.lsp.buf.references()')
  vim.cmd('command! LspTypeDef lua vim.lsp.buf.type_definition()')
  vim.cmd('command! LspImplementation lua vim.lsp.buf.implementation()')
  vim.cmd('command! LspDiagPrev lua vim.diagnostic.goto_prev()')
  vim.cmd('command! LspDiagNext lua vim.diagnostic.goto_next()')
  vim.cmd('command! LspDiagLine lua vim.diagnostic.open_float()')
  vim.cmd('command! LspSignatureHelp lua vim.lsp.buf.signature_help()')
  buf_map(bufnr, 'n', '<Leader>fc', ':LspFormatting<CR>')
  buf_map(bufnr, 'n', 'gd', ':LspDef<CR>')
  buf_map(bufnr, 'n', 'gr', ':LspRename<CR>')
  buf_map(bufnr, 'n', 'gt', ':LspTypeDef<CR>')
  buf_map(bufnr, 'n', 'K', ':LspHover<CR>')
  buf_map(bufnr, 'n', 'ep', ':LspDiagPrev<CR>')
  buf_map(bufnr, 'n', 'en', ':LspDiagNext<CR>')
  buf_map(bufnr, 'n', 'ga', ':LspCodeAction<CR>')
  buf_map(bufnr, 'n', '<Leader>a', ':LspDiagLine<CR>')
  buf_map(bufnr, 'i', '<C-x><C-x>', '<cmd> LspSignatureHelp<CR>')

  if client.server_capabilities.document_formatting then
    vim.api.nvim_create_autocmd('BufWritePre', {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format()
      end,
    })
  end
end

lspconfig.tsserver.setup({
  on_attach = function(client, bufnr)
    client.server_capabilities.document_formatting = true
    client.server_capabilities.document_range_formatting = true
    local ts_utils = require('nvim-lsp-ts-utils')
    ts_utils.setup({})
    ts_utils.setup_client(client)
    buf_map(bufnr, 'n', 'gs', ':TSLspOrganize<CR>')
    buf_map(bufnr, 'n', 'gi', ':TSLspRenameFile<CR>')
    buf_map(bufnr, 'n', 'go', ':TSLspImportAll<CR>')
    on_attach(client, bufnr)
  end,
})

lspconfig.sumneko_lua.setup({
  on_attach = function(client, bufnr)
    client.server_capabilities.document_formatting = true
    client.server_capabilities.document_range_formatting = true
    on_attach(client, bufnr)
  end,
  settings = {
    Lua = {
      diagnostics = {
        globals = {
          'vim',
          'use',
          'describe',
          'it',
          'assert',
          'before_each',
          'after_each',
        },
      },
      completion = {
        showWord = 'Disable',
        callSnippet = 'Disable',
        keywordSnippet = 'Disable',
      },
      workspace = {
        checkThirdParty = false,
        library = vim.api.nvim_get_runtime_file('', true),
      },
    },
  },
})

lspconfig.gopls.setup({
  cmd = { 'gopls' },
  settings = {
    gopls = {
      experimentalPostfixCompletions = true,
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    },
  },
  on_attach = function(client, bufnr)
    client.server_capabilities.document_formatting = true
    client.server_capabilities.document_range_formatting = true
    on_attach(client, bufnr)
  end,
})

null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.stylua.with({
      condition = with_root_file('stylua.toml'),
    }),
  },
  on_attach = on_attach,
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = 'rounded',
})

vim.diagnostic.config({
  float = { border = 'rounded' },
})

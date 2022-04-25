-- local status, cmp = pcall(require, "cmp")
-- if (not status) then return end

local cmp = require'cmp'
local lspkind = require'lspkind'

require "cmp_nvim_lsp"
require "cmp_buffer"

  cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    window = {
      documentation = {
        border = 'rounded',
	winhighlight = 'NormalFloat:NormalFloat,FloatBorder:FloatBorder',
      },
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true
      }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
    }, {
      { name = 'buffer' },
    }),
    formatting = {
      format = lspkind.cmp_format({with_text = false, maxwidth = 50})
    },
  })

  vim.cmd [[highlight! default link CmpItemKind CmpItemMenuDefault]]

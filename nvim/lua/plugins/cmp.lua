-- local status, cmp = pcall(require, "cmp")
-- if (not status) then return end

local cmp = require'cmp'
local lspkind = require'lspkind'
local luasnip = require'luasnip'

require "cmp_nvim_lsp"
require "cmp_buffer"

  cmp.setup({
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
    --    ['<Tab>'] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_next_item()
    --   elseif luasnip.expand_or_jumpable() then
    --     luasnip.expand_or_jump()
    --   else
    --     fallback()
    --   end
    -- end, { 'i', 's' }),
    -- ['<S-Tab>'] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_prev_item()
    --   elseif luasnip.jumpable(-1) then
    --     luasnip.jump(-1)
    --   else
    --     fallback()
    --   end
    -- end, { 'i', 's' }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name =  'luasnip' },
    },
    {
      { name = 'buffer' }
    }),
    formatting = {
      format = lspkind.cmp_format({with_text = false, maxwidth = 50})
    },
    snippet = {
      expand = function(args)
        local luasnip = prequire("luasnip")
        if not luasnip then
          return
        end
        luasnip.lsp_expand(args.body)
      end,
    },
  })

  vim.cmd [[highlight! default link CmpItemKind CmpItemMenuDefault]]

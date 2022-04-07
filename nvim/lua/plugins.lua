--
-- setup treesitter
--

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
}

require('lsp')
require('lspkind')
require('mylualine')

--
-- setup autocomplete
--

local cmp = require'cmp'
  local lspkind = require'lspkind'

  cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
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
    }
  })

  vim.cmd [[highlight! default link CmpItemKind CmpItemMenuDefault]]

--
-- setup telescope
--

local actions = require('telescope.actions')

require('telescope').setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
    file_ignore_patterns = {
      "node_modules/.*",
      ".git",
      ".cache",
      "dist",
      "build",
      "public",
    },
  }
}


--
-- setup devicons
--

require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- DevIcon will be appended to `name`
 override = {
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}

--
-- setup autopairs
--

local status, autopairs = pcall(require, "nvim-autopairs")
if (not status) then return end

autopairs.setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
})

--
-- setup bufferline
--

require("bufferline").setup{}


--
-- setup indentline
--

require("indent_blankline").setup {
    char = "|",
    buftype_exclude = {"terminal"}
}


--
-- setup gitsign
--

require('gitsigns').setup {
  current_line_blame = true
}

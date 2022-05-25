require('nvim-web-devicons').setup({
  override = {},
  default = true,
})

-- require('bufferline').setup({})

require('gitsigns').setup({
  current_line_blame = true,
})

require('nvim-tree').setup({})

require('nvim-treesitter.configs').setup({
  -- A list of parser names, or "all"
  ensure_installed = { 'javascript', 'typescript', 'lua', 'css', 'python', 'go' },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,
  },
})

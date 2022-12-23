require('Comment').setup({})

require("nvim-autopairs").setup({
  disable_filetype = { 'TelescopePrompt', 'vim' },
})

require('gitsigns').setup({
  current_line_blame = true,
})



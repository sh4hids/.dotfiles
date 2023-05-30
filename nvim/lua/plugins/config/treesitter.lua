require('nvim-treesitter.configs').setup({
  ensure_installed = { 'javascript', 'typescript', 'lua', 'css', 'python', 'go', 'vim' },

  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
})

vim.treesitter.language.register('markdown','mdx')

local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

require('telescope').setup {
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

vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fo', builtin.oldfiles, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', 'fh', builtin.help_tags, {})

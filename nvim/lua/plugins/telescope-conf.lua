local status, t = pcall(require, "telescope")
if (not status) then return end

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

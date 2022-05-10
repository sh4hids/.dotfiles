local status, t = pcall(require, "telescope")

if (not status) then
  print("plugins/config/telescope :: telescope not loaded")
  return
end

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

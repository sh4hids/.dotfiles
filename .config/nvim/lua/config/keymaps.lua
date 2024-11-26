-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- vim.keymap.del("t", "<c-j>")

vim.keymap.set("n", "<C-/>", function()
  local Util = require("lazyvim.util")
  Util.terminal(nil, { border = "double" })
end, { desc = "Term with border" })

vim.keymap.set("n", "<leader>ft", function()
  local Util = require("lazyvim.util")
  Util.terminal(nil, { border = "double", cwd = Util.root() })
end, { desc = "Term with border" })

vim.keymap.set("n", "<leader>rn", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })

vim.keymap.set("n", "<leader>bc", function()
  return ":%bd|e#<cr>"
end, { expr = true })

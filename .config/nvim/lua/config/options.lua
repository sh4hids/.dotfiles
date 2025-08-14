-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.lazyvim_rust_diagnostics = "rust-analyzer"
vim.g.virtcolumn_char = "▕" -- char to display the line
vim.g.virtcolumn_priority = 10 -- priority of extmark

vim.o.textwidth = 0
vim.o.wrapmargin = 0
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.textwidth = 80
vim.opt.colorcolumn = "79"
vim.opt.clipboard = ""
vim.opt.foldmethod = "manual"

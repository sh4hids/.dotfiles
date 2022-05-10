local status, go = pcall(require, 'go')
if not status then
  return
end

require('go').setup()

vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)

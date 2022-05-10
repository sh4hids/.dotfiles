local status, lspkind = pcall(require, 'lspkind')
if not status then
  print('plugins/config/lspkind :: lspkind not loaded')
  return
end

local icons = require('plugins.config.lspicons')

lspkind.init({
  mode = 'symbol',
  preset = 'codicons',
  symbol_map = icons,
})

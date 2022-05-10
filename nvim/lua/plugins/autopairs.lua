local status, autopairs = pcall(require, 'nvim-autopairs')
if not status then
  print('plugins/autopairs :: autopairs not loaded')
  return
end

autopairs.setup({
  disable_filetype = { 'TelescopePrompt', 'vim' },
})

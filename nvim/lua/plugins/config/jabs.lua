require('jabs').setup({
  position = { 'center', 'center' },
  border = 'rounded',
  preview = { border = 'rounded' },
  highlight = {
    current = 'ErrorMsg',
    alternate = 'NormalNC',
    hidden = 'NormalNC',
    split = 'Constant',
  },
  use_devicons = false,
  split_filename = true,
  split_filename_path_width = 20,
  symbols = {
    current = '▸', -- default 
    alternate = '▹', -- default 
    hidden = '▹', -- default ﬘
    split = '▹', -- default 
    locked = '▹', -- default 
    ro = '▹', -- default 
    edited = '▹', -- default 
    terminal = '▹', -- default 
    default_file = '▹', -- Filetype icon if not present in nvim-web-devicons. Default 
    terminal_symbol = '▹', -- Filetype icon for a terminal split. Default 
  },
})

vim.keymap.set('n', '<Leader>b', ':JABSOpen<CR>')

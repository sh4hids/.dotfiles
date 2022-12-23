local db = require('dashboard')
vim.g.dashboard_disable_statusline = 1
vim.g.dashboard_default_executive = 'telescope'

local version = vim.version()
local plugins_count = vim.fn.len(vim.fn.globpath('~/.local/share/nvim/site/pack/packer/start', '*', 0, 1))

db.custom_header = {
  '',
  '',
  '',
  '',
  '',
  '',
  '██████  ██ ███████ ███    ███ ██ ██      ██       █████  ██   ██ ',
  '██   ██ ██ ██      ████  ████ ██ ██      ██      ██   ██ ██   ██ ',
  '██████  ██ ███████ ██ ████ ██ ██ ██      ██      ███████ ███████ ',
  '██   ██ ██      ██ ██  ██  ██ ██ ██      ██      ██   ██ ██   ██ ',
  '██████  ██ ███████ ██      ██ ██ ███████ ███████ ██   ██ ██   ██ ',
  '                                                                 ',
  '                                                                 ',
  'N E O V I M - v' .. version.major .. '.' .. version.minor .. '.' .. version.patch,
  '',
  '',
}

db.hide_statusline = true
db.hide_statusline = true
db.footer_pad = 2
db.custom_center = {
  {
    icon = '🔍 ',
    desc = 'Find files          ',
    shortcut = 'Leader ff',
    action = 'Telescope find_files',
  },
  {
    icon = '📄 ',
    desc = 'New file            ',
    shortcut = 'Leader fn',
    action = 'DashboardNewFile',
  },
  {
    icon = '🖥️ ',
    desc = 'Find buffer         ',
    shortcut = 'Leader fb',
    action = 'Telescope buffers',
  },
}

db.custom_footer = {
  '🚀 loaded with ' .. plugins_count .. ' plugins',
  '',
  '',
  '',
  '',
  '',
}

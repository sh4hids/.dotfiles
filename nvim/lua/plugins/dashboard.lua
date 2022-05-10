local plugins_count = vim.fn.len(vim.fn.globpath('~/.local/share/nvim/site/pack/packer/start', '*', 0, 1))
vim.g.dashboard_disable_statusline = 1
vim.g.dashboard_default_executive = 'telescope'

local logo = {

  '',
  '',
  [[███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗]],
  [[████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║]],
  [[██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║]],
  [[██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║]],
  [[██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║]],
  [[╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝]],
}

vim.g.dashboard_custom_header = logo
vim.g.dashboard_custom_section = {
  a = { description = { '  Find File                 LDR ff' }, command = 'Telescope find_files' },
  b = { description = { '  Recents                   LDR fo' }, command = 'Telescope oldfiles' },
  c = { description = { '  Find Word                 LDR fw' }, command = 'Telescope live_grep' },
  d = { description = { '  New File                  LDR fn' }, command = 'DashboardNewFile' },
  e = { description = { '  Bookmarks                 LDR bm' }, command = 'Telescope marks' },
  f = { description = { '  Load Last Session         LDR sl' }, command = 'SessionLoad' },
}

vim.g.dashboard_custom_footer = {
  '   ',
  'NeoVim Loaded ' .. plugins_count .. ' plugins ',
}

local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')

math.randomseed(os.time())

local function button(sc, txt, keybind, keybind_opts)
  local b = dashboard.button(sc, txt, keybind, keybind_opts)
  b.opts.hl = 'Function'
  b.opts.hl_shortcut = 'Type'
  return b
end

local function pick_color()
  local colors = { 'String', 'Identifier', 'Keyword', 'Number' }
  return colors[math.random(#colors)]
end

local function footer()
  local total_plugins = vim.fn.len(vim.fn.globpath('~/.local/share/nvim/site/pack/packer/start', '*', 0, 1))
  local datetime = os.date(' %d %m %Y')

  local footer_text = datetime
    .. '   '
    .. total_plugins
    .. ' plugins'
    .. '   v'
    .. vim.version().major
    .. '.'
    .. vim.version().minor
    .. '.'
    .. vim.version().patch

  return [[
   
  ]] .. footer_text .. [[ 
 
   
  ]]
end

dashboard.section.header.val = {

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
}
dashboard.section.header.opts.hl = pick_color()

dashboard.section.buttons.val = {
  button('<Ctrl>n', '  File Explorer'),
  button('ff', '  Find file'),
  button('<Leader>n', '  New file'),
  button('<Leader>u', '  Update plugins'),
  button('q', '  Quit', '<Cmd>qa<CR>'),
}

dashboard.section.footer.val = footer()
dashboard.section.footer.opts.hl = 'Constant'

alpha.setup(dashboard.opts)

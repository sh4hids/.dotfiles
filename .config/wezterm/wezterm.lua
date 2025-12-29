local wezterm = require('wezterm')

local config = wezterm.config_builder()

config.font_size = 20
config.color_scheme = 'zenbones'
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = 'INTEGRATED_BUTTONS | RESIZE'
config.enable_scroll_bar = false
config.window_padding = {
  left = 0,
  right = 0,
  top = 20,
  bottom = 0,
}
config.font = wezterm.font('RecMonoSmCasual Nerd Font')

return config

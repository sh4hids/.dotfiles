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
  top = 10,
  bottom = 0,
}
config.window_background_opacity = 0.9
config.macos_window_background_blur = 20
config.text_background_opacity = 0.6

return config

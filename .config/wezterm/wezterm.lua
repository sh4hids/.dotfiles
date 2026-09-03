local wezterm = require('wezterm')

local config = wezterm.config_builder()
local is_in_dark_mode = wezterm.gui.get_appearance():find('Dark')

config.font_size = 20
config.line_height = 1.2
config.use_fancy_tab_bar = false
config.window_decorations = 'RESIZE'
config.hide_tab_bar_if_only_one_tab = true
config.enable_scroll_bar = false

config.window_padding = {
  left = 24,
  right = 24,
  top = 60,
  bottom = 24,
}

config.font = wezterm.font('RecMonoSmCasual Nerd Font')
config.macos_window_background_blur = 40

if is_in_dark_mode then
  config.color_scheme = 'kanagawabones'
  config.window_background_opacity = 0.4
  config.text_background_opacity = 0.4
else
  config.color_scheme = 'rose-pine-dawn'
  config.window_background_opacity = 0.6
  config.text_background_opacity = 0.6
end

return config

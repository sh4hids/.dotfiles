local wezterm = require('wezterm')

local config = wezterm.config_builder()

config.font_size = 20
config.line_height = 1.2
config.color_scheme = 'zenbones'
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
config.window_background_opacity = 0.4
config.text_background_opacity = 0.4
config.macos_window_background_blur = 40
-- config.window_background_image = '/Users/shahid/.dotfiles/assets/wallpapers/bg-blurred-2.png'

return config

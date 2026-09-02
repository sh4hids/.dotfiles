local wezterm = require('wezterm')

local config = wezterm.config_builder()

local function get_scheme_by_appearance()
  if wezterm.gui.get_appearance():find('Dark') then
    return 'kanagawabones'
  else
    return 'rose-pine-dawn'
  end
end

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

config.color_scheme = get_scheme_by_appearance()

config.window_background_opacity = 0.4
config.text_background_opacity = 0.4

return config

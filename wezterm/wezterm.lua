local wezterm = require 'wezterm';

return {
  font = wezterm.font_with_fallback({
    "Fantasque Sans Mono",
    "FiraCode Nerd Font Mono",
  }),
  use_fancy_tab_bar = false,
  color_scheme = "MaterialOcean",
  font_size = 20,
  window_background_opacity = 0.9,
  text_background_opacity = 0.2,
  startingDirectory = ".",
  window_frame = {
    inactive_titlebar_bg = "#121621",
    active_titlebar_bg = "#121621"
  }
}

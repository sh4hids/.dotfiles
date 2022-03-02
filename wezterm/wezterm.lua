local wezterm = require 'wezterm';

return {
  font = wezterm.font_with_fallback({
    "Fantasque Sans Mono",
    "FiraCode Nerd Font Mono",
  }),
  color_scheme = "MaterialOcean",
  font_size = 20,
  text_background_opacity = 0.3,
  window_background_image = "/home/sim/.dotfiles/wezterm/term-bg.png",
}

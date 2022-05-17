local wezterm = require('wezterm')

function os.capture(cmd, raw)
  local f = assert(io.popen(cmd, 'r'))
  local s = assert(f:read('*a'))
  f:close()
  if raw then
    return s
  end
  s = string.gsub(s, '^%s+', '')
  s = string.gsub(s, '%s+$', '')
  s = string.gsub(s, '[\n\r]+', ' ')
  return s
end

local os = os.capture('uname')
local font = wezterm.font_with_fallback({
  'Fantasque Sans Mono',
  'FiraCode Nerd Font Mono',
})

if os == 'Darwin' then
  font = nil
end

return {
  font = font,
  use_fancy_tab_bar = false,
  color_scheme = 'MaterialOcean',
  font_size = 20,
  window_background_opacity = 0.9,
  text_background_opacity = 0.2,
  startingDirectory = '.',
  window_frame = {
    inactive_titlebar_bg = '#121621',
    active_titlebar_bg = '#121621',
  },
}

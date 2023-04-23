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
  'FantasqueSansMono Nerd Font',
  'FiraCode Nerd Font Mono',
})

if os == 'Darwin' then
  font = nil
end

local keys = {
  -- This will create a new split and run the `top` program inside it
  {
    key = '"',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitVertical({
      domain = 'CurrentPaneDomain',
      -- args = { 'top' },
    }),
  },
  {
    key = '%',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitHorizontal({ domain = 'CurrentPaneDomain' }),
  },
}

return {
  font = font,
  use_fancy_tab_bar = false,
  color_scheme = 'horizon',
  font_size = 20,
  window_background_opacity = 0.9,
  text_background_opacity = 0.8,
  -- startingDirectory = '.',
  window_frame = {
    inactive_titlebar_bg = '#1c1e26',
    active_titlebar_bg = '#1c1e26',
  },
  keys = keys,
}

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

local current_os = os.capture('uname')
local font = wezterm.font_with_fallback({
  'FantasqueSansMono Nerd Font',
  'FiraCode Nerd Font Mono',
})

if current_os == 'Darwin' then
  font = nil
end

local keys = {
  -- This will create a new split and run the `top` program inside it
  {
    key = '"',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitVertical({
      domain = 'CurrentPaneDomain',
    }),
  },
  {
    key = '%',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitHorizontal({ domain = 'CurrentPaneDomain' }),
  },
}

local get_background = function()
  return {
    source = {
      Gradient = {
        colors = { '#000000' },
      },
    },
    width = '100%',
    height = '100%',
    opacity = 0.32,
  }
end

local get_wallpaper = function()
  return {
    source = { File = { path = os.getenv('HOME') .. '/.dotfiles/wezterm/sakura.png' } },
    height = 'Cover',
    width = 'Cover',
    horizontal_align = 'Left',
    repeat_x = 'Repeat',
    repeat_y = 'Repeat',
    opacity = 1,
  }
end

local background = {
  get_wallpaper(),
  get_background(),
}

return {
  font = font,
  use_fancy_tab_bar = false,
  color_scheme = 'horizon',
  font_size = 20,
  -- window_background_opacity = 0.9,
  macos_window_background_blur = 30,
  text_background_opacity = 0.32,
  window_decorations = 'INTEGRATED_BUTTONS | RESIZE',
  window_frame = {
    inactive_titlebar_bg = '#1e1e26',
    active_titlebar_bg = '#1e1e1e',
  },
  keys = keys,
  background = background,
}

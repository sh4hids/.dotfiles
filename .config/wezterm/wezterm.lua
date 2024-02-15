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

local function get_font()
  local current_os = os.capture('uname')
  local font = wezterm.font_with_fallback({
    'FantasqueSansMono Nerd Font',
    'FiraCode Nerd Font Mono',
  })

  if current_os == 'Darwin' then
    font = nil
  end

  return font
end

local get_background_color = function(mode)
  local colors = { '#ffffff' }
  local opacity = 0.8

  if mode == 'dark' then
    colors = { '#000000' }
    opacity = 0.5
  end

  return {
    source = {
      Gradient = {
        colors = colors,
      },
    },
    width = '100%',
    height = '100%',
    opacity = opacity,
  }
end

local get_wallpaper = function(mode)
  local image_path = '/.config/wezterm/bloom.png'

  if mode == 'dark' then
    image_path = '/.config/wezterm/sakura.png'
  end

  return {
    source = { File = { path = os.getenv('HOME') .. image_path } },
    height = 'Cover',
    width = 'Cover',
    horizontal_align = 'Left',
    repeat_x = 'Repeat',
    repeat_y = 'Repeat',
    opacity = 1,
  }
end

local function get_background(mode)
  return {
    get_wallpaper(mode),
    get_background_color(mode),
  }
end

local keys = {
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

local color_mode = 'dark'
local color_scheme = 'horizon'

if color_mode == 'light' then
  color_scheme = 'dayfox'
end

return {
  font = get_font(),
  use_fancy_tab_bar = false,
  color_scheme = color_scheme,
  font_size = 20,
  macos_window_background_blur = 30,
  text_background_opacity = 0.3,
  window_decorations = 'INTEGRATED_BUTTONS | RESIZE',
  window_frame = {
    inactive_titlebar_bg = '#1e1e26',
    active_titlebar_bg = '#1e1e1e',
  },
  keys = keys,
  background = get_background(color_mode),
}

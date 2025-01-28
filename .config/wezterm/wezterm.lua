local wezterm = require('wezterm')
local theme = wezterm.plugin.require('https://github.com/neapsix/wezterm').dawn

-- local color_mode = 'dark'
local color_mode = 'light'

if color_mode == 'dark' then
  theme = wezterm.plugin.require('https://github.com/neapsix/wezterm').main
end

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
    'FantasqueSansM Nerd Font',
    'FiraCode Nerd Font',
  })

  if current_os == 'Darwin' then
    font = nil
  end

  return font
end

local get_background_color = function(mode)
  local colors = { '#faf4ed' }
  local opacity = 0.5

  if mode == 'dark' then
    colors = { '#232136' }
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
    opacity = 0.9,
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

return {
  font = get_font(),
  colors = theme.colors(),
  use_fancy_tab_bar = false,
  font_size = 20,
  macos_window_background_blur = 30,
  text_background_opacity = 0.5,
  window_decorations = 'INTEGRATED_BUTTONS | RESIZE',
  window_frame = {
    inactive_titlebar_bg = '#1e1e26',
    active_titlebar_bg = '#1e1e1e',
  },
  keys = keys,
  background = get_background(color_mode),
}

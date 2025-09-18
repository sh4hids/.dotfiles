local wezterm = require('wezterm')
local theme = wezterm.plugin.require('https://github.com/neapsix/wezterm').dawn

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

local get_background_color = function()
  local colors = { '#faf4ed' }
  local opacity = 0.90

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

local function get_background()
  return {
    get_background_color(),
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
  macos_window_background_blur = 16,
  window_decorations = 'INTEGRATED_BUTTONS | RESIZE',
  window_frame = {
    inactive_titlebar_bg = '#1e1e26',
    active_titlebar_bg = '#1e1e1e',
  },
  keys = keys,
  background = get_background(),
}

local function clock()
  local time = os.time();
  return os.date('%H:%M', time);
end

require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'nightfly',
    component_separators = {'|', '|'},
    section_separators = {'▒', '▒'},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename','location'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {clock}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

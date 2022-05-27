local status, lualine = pcall(require, 'lualine')
if not status then
  print('plugins/config/lualine :: lualine not loaded')
  return
end

local function clock()
  local time = os.time()
  return os.date('%I:%M %p', time)
end

lualine.setup({
  options = {
    theme = 'horizon',
    icons_enabled = true,
    component_separators = { '┊', '┊' },
    section_separators = { '▒', '▒' },
    disabled_filetypes = { 'NvimTree', 'dashboard' },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },
    lualine_c = { 'filename', 'location' },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { clock },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
})

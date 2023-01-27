require('indent_blankline').setup({
  char = '┆', -- ¦, ┆, │, ⎸, or ▏
  buftype_exclude = { 'terminal' },
  filetype_exclude = { 'dashboard' },
  show_end_of_line = true,
  space_char_blankline = ' ',
  show_current_context_start = true,
})
local keymap = vim.keymap.set
local cmd = vim.cmd

-- Highlight
keymap('n', '<leader>h', ':nohlsearch<CR>')
keymap('n', '<leader>n', ':enew<CR>')

-- Plugins
keymap('n', '<leader>u', ':PackerSync<CR>')

-- Move between split windows
keymap('n', '<c-h>', '<C-w>h')
keymap('n', '<c-j>', '<C-w>j')
keymap('n', '<c-k>', '<C-w>k')
keymap('n', '<c-l>', '<C-w>l')

-- Disable capslock
cmd([[
  au InsertEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape' 
  au InsertLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
  au BufWinLeave *.* mkview
  au BufWinEnter *.* silent loadview
]])

-- Disable arrow keys
keymap('', '<up>', '<nop>')
keymap('', '<down>', '<nop>')
keymap('', '<left>', '<nop>')
keymap('', '<right>', '<nop>')

-- Better File Saving
keymap('n', '<c-s>', ':w<CR>')
keymap('i', '<c-s>', '<Esc>:w<CR>a')

-- Better selected line movement
keymap('x', 'J', ":move '>+1<CR>gv-gv")
keymap('x', 'K', ":move '<-2<CR>gv-gv")

-- Misc
keymap('n', '<leader>s', ':so %<CR>')

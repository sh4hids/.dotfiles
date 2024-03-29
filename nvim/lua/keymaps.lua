local keymap = vim.api.nvim_set_keymap
local nvim_exec = vim.api.nvim_exec
local keymapOptions = { noremap = true }

nvim_exec([[au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape']], false)
nvim_exec([[au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock']], false)
nvim_exec([[au BufWinLeave *.* mkview]], false)
nvim_exec([[au BufWinEnter *.* silent loadview]], false)

keymap('n', '<c-h>', '<C-w>h', keymapOptions)
keymap('n', '<c-j>', '<c-w>j', keymapOptions)
keymap('n', '<c-k>', '<c-w>k', keymapOptions)
keymap('n', '<c-l>', '<C-w>l', keymapOptions)

-- keymapOptions = {}
keymapOptions = { noremap = true, silent = true }

keymap('n', '<Leader>ef', [[:NvimTreeToggle<cr>]], keymapOptions)
keymap('n', '<Leader>ec', [[:tabedit ~/.dotfiles/nvim/init.lua<cr>]], keymapOptions)
keymap('n', '<Leader>ep', [[:tabedit ~/.dotfiles/nvim/lua/plugins/install.lua<cr>]], keymapOptions)
keymap('n', '<Leader>sc', [[:luafile ~/.dotfiles/nvim/init.lua<cr>]], keymapOptions)
keymap('n', '<Leader><space>', [[:nohlsearch<cr>]], keymapOptions)

-- Better File Saving

keymap('n', '<c-s>', ':w<CR>', keymapOptions)
keymap('i', '<c-s>', '<Esc>:w<CR>a', keymapOptions)

-- Better Tab Movement

keymap('n', '<s-l>', ':BufferLineCycleNext<CR>', keymapOptions)
keymap('n', '<s-h>', ':BufferLineCyclePrev<CR>', keymapOptions)

keymapOptions = { noremap = true, silent = true }

keymap('n', 'ff', ':Telescope find_files<CR>', keymapOptions)
keymap('n', 'fr', ':Telescope live_grep<CR>', keymapOptions)
keymap('n', 'fb', ':Telescope buffers<CR>', keymapOptions)
keymap('n', 'fh', ':Telescope help_tags<CR>', keymapOptions)
keymap('n', 'fn', ':DashboardNewFile<CR>', keymapOptions)

keymap('', '<up>', '<nop>', keymapOptions)
keymap('', '<down>', '<nop>', keymapOptions)
keymap('', '<left>', '<nop>', keymapOptions)
keymap('', '<right>', '<nop>', keymapOptions)

-- Better Selected Line Movement

keymapOptions = { silent = true }

keymap('x', 'J', ":move '>+1<CR>gv-gv", keymapOptions)
keymap('x', 'K', ":move '<-2<CR>gv-gv", keymapOptions)

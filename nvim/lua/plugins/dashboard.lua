local plugins_count = vim.fn.len(vim.fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1))
vim.g.dashboard_disable_statusline = 1
vim.g.dashboard_default_executive ='telescope'

local alien = {

'',
'',
 [[███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗]],
 [[████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║]],
 [[██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║]],
 [[██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║]],
 [[██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║]],
 [[╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝]],

}


vim.g.dashboard_custom_header = alien
vim.g.dashboard_custom_section = {
    a = {description = {"  Find File                 SPC f f"}, command = "Telescope find_files"},
    b = {description = {"  Recents                   SPC f o"}, command = "Telescope oldfiles"},
    c = {description = {"  Find Word                 SPC f w"}, command = "Telescope live_grep"},
    d = {description = {"  New File                  SPC f n"}, command = "DashboardNewFile"},
    e = {description = {"  Bookmarks                 SPC b m"}, command = "Telescope marks"},
    f = {description = {"  Load Last Session         SPC s l"}, command = "SessionLoad"}
}

vim.g.dashboard_custom_footer = {
    "   ",
    "NeoVim Loaded " .. plugins_count .. " plugins ",
}

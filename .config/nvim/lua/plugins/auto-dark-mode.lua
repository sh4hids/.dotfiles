return {
  {
    "f-person/auto-dark-mode.nvim",
    opts = {
      update_interval = 3000, -- How often to check system theme in milliseconds
      set_dark_mode = function()
        vim.cmd("colorscheme kanagawabones") -- Replace with your dark theme
      end,
      set_light_mode = function()
        vim.cmd("colorscheme rose-pine-dawn") -- Replace with your light theme
      end,
    },
  },
}

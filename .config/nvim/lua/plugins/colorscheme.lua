-- return {
--   "tiagovla/tokyodark.nvim",
--   opts = {
--     -- custom options here
--   },
--   config = function(_, opts)
--     require("tokyodark").setup(opts) -- calling setup is optional
--     vim.cmd([[colorscheme tokyodark]])
--   end,
-- }

-- return {
--   "rose-pine/neovim",
--   name = "rose-pine",
--   config = function()
--     vim.cmd("colorscheme rose-pine")
--   end,
-- }

return {
  {
    "zenbones-theme/zenbones.nvim",
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    priority = 1000,
    -- you can set set configuration options here
    config = function()
      vim.g.zenbones_darken_comments = 45
      vim.cmd.colorscheme("kanagawabones")
    end,
  },
}

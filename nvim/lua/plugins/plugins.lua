--
-- setup telescope
--



--
-- setup devicons
--

require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- DevIcon will be appended to `name`
 override = {
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}

--
-- setup autopairs
--

local status, autopairs = pcall(require, "nvim-autopairs")
if (not status) then return end

autopairs.setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
})

--
-- setup bufferline
--

require("bufferline").setup{}


--
-- setup indentline
--



--
-- setup gitsign
--

require('gitsigns').setup {
  current_line_blame = true
}

require'nvim-tree'.setup {
}

-- require'nvim-treesitter.configs'.setup {
--   ensure_installed = "all",
--   highlight = {
--     enable = true,
--   },
-- }


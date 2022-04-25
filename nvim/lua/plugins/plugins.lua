--
-- setup treesitter
--

require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  highlight = {
    enable = true,
  },
}

--
-- setup telescope
--

local actions = require('telescope.actions')

require('telescope').setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
    file_ignore_patterns = {
      "node_modules/.*",
      ".git",
      ".cache",
      "dist",
      "build",
      "public",
    },
  }
}


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

require("indent_blankline").setup {
    char = "|",
    buftype_exclude = {"terminal"}
}


--
-- setup gitsign
--

require('gitsigns').setup {
  current_line_blame = true
}

require'nvim-tree'.setup {
}

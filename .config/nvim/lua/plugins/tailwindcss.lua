return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tailwindcss = {
          settings = {
            tailwindCSS = {
              classAttributes = { "class", "className", "class:list", "classList", "ngClass", ".*Classes.*" },
              experimental = {
                classRegex = {
                  -- tailwind-variants
                  { "tv\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },

                  -- CVA (with support for JSON)
                  { 'cva(s*("[^"]*"|s*,s*|{(?:[^{}]|(?:{(?:[^{}]|(?:{[^{}]*}))*}))*}s*)*)' },

                  -- `cx()` function from classnames / clsx
                  { "cx\\(([^)]*)\\)", "(?:\"|'|`)([^(?:\"|'|`)]*)(?:\"|'|`)" },

                  -- Wrap style objects in `/*tw*/` before/after comments
                  { "/\\*tw\\*/ ([^]*) /\\*tw\\*/", "'([^']*)'" },
                },
              },
            },
          },
        },
      },
    },
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        mode = "virtualtext",
        tailwind = true,
        virtualtext = "⬢",
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
    },
    opts = function(_, opts)
      -- original LazyVim kind icon formatter
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        format_kinds(entry, item) -- add icons
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end
    end,
  },
}

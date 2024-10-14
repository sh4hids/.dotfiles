return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
      })

      opts.presets.lsp_doc_border = true
      opts.lsp.signature = {
        auto_open = { enabled = false },
      }
    end,
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 3000,
    },
  },
  {
    "echasnovski/mini.icons",
    opts = {
      extension = {

        astro = { glyph = "", hl = "MiniIconsOrange" },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },
}

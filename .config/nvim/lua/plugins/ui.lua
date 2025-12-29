return {
  {
    "mason-org/mason.nvim",
    opts = {
      ui = {
        border = "rounded",
      },
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      lsp = {
        hover = { silent = true },
      },
      presets = {
        lsp_doc_border = true,
      },
    },
  },
}

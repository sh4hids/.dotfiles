return {
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },
  {
    "chrisgrieser/nvim-chainsaw",
    opts = {
      marker = "🚧",
    },
    keys = {
      {
        "<leader>ms",
        function()
          require("chainsaw").messageLog()
        end,
        desc = "󰸢 message log",
      },
      {
        "<leader>mv",
        function()
          require("chainsaw").variableLog()
        end,
        mode = { "n", "x" },
        desc = "󰸢 variable log",
      },
      {
        "<leader>mo",
        function()
          require("chainsaw").objectLog()
        end,
        mode = { "n", "x" },
        desc = "󰸢 object log",
      },
      {
        "<leader>mt",
        function()
          require("chainsaw").timeLog()
        end,
        desc = "󰸢 time log",
      },
      {
        "<leader>mr",
        function()
          require("chainsaw").removeLogs()
        end,
        desc = "󰹝 remove logs",
      },
    },
  },
}

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    defaults = {},
    spec = {
      {
        mode = { "n", "v" },
        { "<leader>f", group = "Find files" },
      },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}

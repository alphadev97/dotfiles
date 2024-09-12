return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = function()
    require("gruvbox").setup({
      transparent_mode = true, -- Enable transparent background
      contrast = "hard", -- Options: "hard", "medium", "soft" (adjust to your liking)
      overrides = {
        Normal = { bg = "none" }, -- Removes background color for transparency
        NormalFloat = { bg = "none" }, -- For floating windows
      },
    })

    -- Set the color scheme to gruvbox
    vim.cmd.colorscheme("gruvbox")
  end,
}

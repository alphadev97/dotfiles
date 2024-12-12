return {
  "rcarriga/nvim-notify",
  config = function()
    -- Set nvim-notify as the default notification handler
    vim.notify = require("notify")

    -- Configure nvim-notify
    require("notify").setup({
      stages = "fade_in_slide_out", -- Options: fade, slide, static, fade_in_slide_out
      timeout = 3000,              -- Time in ms to keep notifications visible
      background_colour = "#000000", -- Background color
      render = "minimal",           -- Options: default, minimal
      max_width = 50,
      max_height = 20,
    })

  end,
}

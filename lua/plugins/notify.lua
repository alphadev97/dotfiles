return {
  "rcarriga/nvim-notify",
  config = function()
    local notify = require("notify")
    notify.setup({
      stages = "fade_in_slide_out", 
      timeout = 2000,             
      background_colour = "#000000", 
      max_width = 50,
      max_height = 10,
      icons = {
        INFO = "",
        WARN = "",
        ERROR = "",
        DEBUG = "",
        TRACE = "✎",
      },
    })

    vim.notify = notify

    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = "*",
      callback = function()
        notify("File saved successfully!", "INFO", { title = "Save Notification" })
      end,
    })
  end,
}

return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        numbers = function(opts)
          return string.format("%s", opts.ordinal) -- Show buffer numbers
        end,
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            text_align = "left",
            separator = true,
          },
        },
      },
    })

    -- Keymaps for interacting with buffers using 'b' prefix
    local keymap = vim.keymap

    keymap.set("n", "bn", ":BufferLineCycleNext<CR>", { desc = "Switch to next buffer" })

    keymap.set("n", "bp", ":BufferLineCyclePrev<CR>", { desc = "Switch to previous buffer" })

    -- Go to buffer 1 to 9
    for i = 1, 9 do
      keymap.set("n", "<leader>" .. i, ":BufferLineGoToBuffer " .. i .. "<CR>", { desc = "Switch to buffer " })
    end

    keymap.set("n", "bb", ":bd<CR>", { desc = "Close the current buffer" })

    keymap.set("n", "bd", ":BufferLinePickClose<CR>", { desc = "Close all buffers" })

    keymap.set("n", "bp", ":BufferLinePick<CR>", { desc = "Pick a buffer to switch to" })

    keymap.set("n", "br", ":BufferLineMoveNext<CR>", { desc = "Re-order buffers right" })

    keymap.set("n", "bl", ":BufferLineMovePrev<CR>", { desc = "Re-order buffers left" })

    keymap.set(
      "n",
      "bD",
      ":BufferLineCloseLeft<CR>:BufferLineCloseRight<CR>",
      { desc = "Close all buffers except the current one" }
    )
  end,
}

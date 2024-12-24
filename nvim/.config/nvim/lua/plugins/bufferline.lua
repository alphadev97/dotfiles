return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
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
    local opts = { noremap = true, silent = true }

    -- Register keymaps with descriptions for which-key
    opts.desc = "Switch to next buffer"
    keymap.set("n", "bn", ":BufferLineCycleNext<CR>", opts)

    opts.desc = "Switch to previous buffer"
    keymap.set("n", "bp", ":BufferLineCyclePrev<CR>", opts)

    -- Go to buffer 1 to 9
    for i = 1, 9 do
      opts.desc = "Switch to buffer " .. i
      keymap.set("n", "b" .. i, ":BufferLineGoToBuffer " .. i .. "<CR>", opts)
    end

    opts.desc = "Close the current buffer"
    keymap.set("n", "bb", ":bd<CR>", opts)

    opts.desc = "Close all buffers"
    keymap.set("n", "bB", ":BufferLinePickClose<CR>", opts)

    opts.desc = "Pick a buffer to switch to"
    keymap.set("n", "bp", ":BufferLinePick<CR>", opts)

    opts.desc = "Re-order buffers right"
    keymap.set("n", "br", ":BufferLineMoveNext<CR>", opts)

    opts.desc = "Re-order buffers left"
    keymap.set("n", "bl", ":BufferLineMovePrev<CR>", opts)
  end,
}

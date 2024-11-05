return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    options = {
      numbers = "none", -- Show buffer numbers: "none", "ordinal", "buffer_id"
      close_command = "bdelete! %d", -- Command to close a buffer
      right_mouse_command = "bdelete! %d", -- Right-click to close a buffer
      left_mouse_command = "buffer %d", -- Left-click to go to buffer
      middle_mouse_command = nil, -- Disable middle-click close
      indicator = { icon = "▎", style = "icon" }, -- Custom buffer indicator
      buffer_close_icon = "", -- Icon for closing a buffer
      modified_icon = "●", -- Icon for modified buffers
      close_icon = "", -- Icon for closing all buffers
      show_close_icon = false, -- Hide global close icon
      separator_style = "slant", -- Separator style: "slant", "thick", "thin", or custom
      always_show_bufferline = true, -- Show bufferline even with a single buffer
      diagnostics = "nvim_lsp", -- Show LSP diagnostics in the bufferline
      diagnostics_indicator = function(count, _, _)
        return "(" .. count .. ")" -- Display diagnostics count in buffer
      end,
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "center",
          separator = true,
        },
      },
    },
  },
  config = function()
    require("bufferline").setup {
      options = {
        -- Place all additional options here if needed
      }
    }

    -- Keybindings
    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    -- Navigate between buffers
    map("n", "<Tab>", ":BufferLineCycleNext<CR>", opts)
    map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opts)

    -- Move buffers
    map("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", opts)
    map("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", opts)
    map("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", opts)
    map("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", opts)
    map("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", opts)
    map("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", opts)
    map("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", opts)
    map("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>", opts)
    map("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>", opts)
    map("n", "<leader>$", ":BufferLineGoToBuffer -1<CR>", opts) -- Last buffer

    -- Buffer close keybindings
    map("n", "<leader>bc", ":BufferLinePickClose<CR>", opts) -- Pick a buffer to close
    map("n", "<leader>bp", ":BufferLineTogglePin<CR>", opts) -- Pin/unpin current buffer
    map("n", "<leader>br", ":BufferLineCloseRight<CR>", opts) -- Close buffers to the right
    map("n", "<leader>bl", ":BufferLineCloseLeft<CR>", opts) -- Close buffers to the left
    map("n", "<leader>bo", ":BufferLineCloseOthers<CR>", opts) -- Close all other buffers
  end,
}


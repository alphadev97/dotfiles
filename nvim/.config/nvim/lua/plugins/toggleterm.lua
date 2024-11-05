return {
  "akinsho/toggleterm.nvim",
  keys = {
    {
      "<leader>ft",
      function()
        require("toggleterm").toggle()
      end,
      desc = "Toggle Terminal",
    },
  },
  config = function()
    require("toggleterm").setup({
      -- Optional: add any options here
      size = 20,
      open_mapping = [[<c-\>]],  -- If you want an additional shortcut
      hide_numbers = true,       -- Hide line numbers in toggleterm
      shade_terminals = true,    -- Shade terminal background
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,    -- Use mapped keys in insert mode
      terminal_mappings = true,  -- Use mapped keys in terminal mode
      direction = "horizontal",  -- Can be 'horizontal', 'vertical', 'tab', or 'float'
      close_on_exit = true,      -- Close terminal window on process exit
      shell = vim.o.shell,       -- Use default shell
      float_opts = {
        border = "curved",
        width = 80,
        height = 25,
        winblend = 3,
      },
    })
  end,
}


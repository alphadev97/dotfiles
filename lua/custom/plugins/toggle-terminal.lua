return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      size = 20, -- Height of the terminal window when opened horizontally
      open_mapping = [[<c-\>]], -- Keybinding to toggle the terminal
      hide_numbers = true, -- Hide the line numbers
      shade_filetypes = {},
      shade_terminals = true, -- Enable shading of terminal windows
      shading_factor = 2, -- The degree by which to darken the terminal window (1: mild, 3: dark)
      start_in_insert = true, -- Start terminal in insert mode
      insert_mappings = true, -- Allow terminal toggle with the mapping in insert mode
      persist_size = true, -- Keep the terminal size persistent across sessions
      direction = 'horizontal', -- Other options: 'vertical' | 'tab' | 'float'
      close_on_exit = true, -- Close the terminal when the process exits
      shell = vim.o.shell, -- Use the default shell
      float_opts = {
        border = 'curved', -- Border type: 'single' | 'double' | 'shadow' | 'curved'
        winblend = 0,
        highlights = {
          border = 'Normal',
          background = 'Normal',
        },
      },
    }

    -- Function to handle setting up keybindings in terminal mode
    function _G.set_terminal_keymaps()
      local opts = { noremap = true }
      vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
    end

    -- Apply keymaps only to terminal buffers
    vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'
  end,
}

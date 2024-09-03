return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  lazy = false,
  config = function()
    local devicons = require('nvim-web-devicons')

    require('bufferline').setup {
      options = {
        numbers = "none",  
        diagnostics = "nvim_lsp", 

        -- Show buffer close button
        close_command = function(bufnr) vim.api.nvim_buf_delete(bufnr, { force = true }) end,
        right_mouse_command = function(bufnr) vim.api.nvim_buf_delete(bufnr, { force = true }) end,

        indicator = {
          icon = '▎', 
          style = 'icon', 
        },

        show_buffer_icons = true, 
        show_buffer_close_icons = true,  

        get_element_icon = function(buf)
          if type(buf) ~= "number" then
            return " ", nil  
          end
          local filename = vim.api.nvim_buf_get_name(buf)
          local filetype = vim.fn.fnamemodify(filename, ':e')
          return devicons.get_icon(filename, filetype, { default = false })
        end,

        color_icons = true, 
        separator_style = "slant",  

        always_show_bufferline = true, 

        highlights = {
          fill = {
            guibg = "#1E1E1E", 
          },
          background = {
            guibg = "#2E2E2E", 
            guifg = "#5C5C5C", 
          },
          buffer_selected = {
            guifg = "#DCDCDC", 
            gui = "bold",  
            guibg = "#2E2E2E", 
          },
          separator = {
            guifg = "#1E1E1E", 
            guibg = "#2E2E2E", 
          },
          separator_selected = {
            guifg = "#1E1E1E", 
          },
          separator_visible = {
            guifg = "#1E1E1E", 
          },
          indicator_selected = {
            guifg = "#FF6C6B", 
          },
        },
      },
    }

    vim.api.nvim_set_keymap('n', '<leader>[', '<Cmd>BufferLineCyclePrev<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>]', '<Cmd>BufferLineCycleNext<CR>', { noremap = true, silent = true })
  end
}

return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons', -- For file icons
  config = function()
    require('bufferline').setup {
      options = {
        numbers = 'ordinal', -- Show buffer numbers in ordinal format
        close_command = 'bdelete! %d', -- Command to delete buffers (current buffer only)
        right_mouse_command = 'bdelete! %d', -- Close buffer with right-click
        left_mouse_command = 'buffer %d', -- Switch to buffer with left-click
        middle_mouse_command = nil, -- Disable middle mouse button action
        indicator = {
          icon = '▎', -- Icon to show the active buffer
          style = 'icon', -- Style for buffer indicator (icon, underline, etc.)
        },
        buffer_close_icon = '', -- Icon to show for closing buffers
        modified_icon = '●', -- Icon for modified buffers
        close_icon = '', -- Icon for closing the bufferline
        left_trunc_marker = '', -- Icon when buffer list is truncated on the left
        right_trunc_marker = '', -- Icon when buffer list is truncated on the right
        max_name_length = 18, -- Maximum length of buffer names
        max_prefix_length = 15, -- Maximum length of buffer name prefix
        tab_size = 18, -- Width of each tab
        diagnostics = 'nvim_lsp', -- Enable diagnostics with LSP
        diagnostics_update_in_insert = false, -- Don't update diagnostics in insert mode
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local icon = level:match 'error' and '' or ''
          return ' ' .. icon .. count
        end,
        offsets = {
          {
            filetype = 'NvimTree',
            text = 'File Explorer',
            highlight = 'Directory',
            text_align = 'left',
          },
        },
        show_buffer_icons = true, -- Show filetype icons in bufferline
        show_buffer_close_icons = true, -- Show close icon for each buffer
        show_close_icon = true, -- Show global close icon
        show_tab_indicators = true, -- Show indicators for tabs
        persist_buffer_sort = true, -- Keep buffers sorted after manual reordering
        separator_style = 'thin', -- Choose 'thin', 'slant', 'padded_slant', etc.
        enforce_regular_tabs = true, -- Enforce equal width for all tabs
        always_show_bufferline = true, -- Always show the bufferline even with one buffer
      },
    }

    -- Keymaps for navigating buffers
    vim.api.nvim_set_keymap('n', '<leader>[', '<Cmd>BufferLineCyclePrev<CR>', { noremap = true, silent = true }) -- Previous buffer
    vim.api.nvim_set_keymap('n', '<leader>]', '<Cmd>BufferLineCycleNext<CR>', { noremap = true, silent = true }) -- Next buffer
  end,
}

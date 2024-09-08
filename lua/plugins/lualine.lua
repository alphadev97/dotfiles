return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup({
      options = {
        theme = 'auto',
        section_separators = '',
        component_separators = ''
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'},
      },
      tabline = {
        lualine_a = {'buffers'},
        lualine_z = {'tabs'}
      },
      extensions = {}
    })
    vim.keymap.set('n', '<leader>[', ':bprevious<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>]', ':bnext<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>q', ':bdelete<CR>', { noremap = true, silent = true })
  end
}

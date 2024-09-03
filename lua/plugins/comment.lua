return {
  'numToStr/Comment.nvim',
  lazy = false,
  opts = {
    -- You can add options here if needed
  },
  config = function()
    require('Comment').setup()

    vim.keymap.set('n', '<leader>/', '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>', { noremap = true, silent = true })
    vim.keymap.set('v', '<leader>/', '<esc><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', { noremap = true, silent = true })
  end
}

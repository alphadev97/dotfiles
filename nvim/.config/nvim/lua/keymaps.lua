local function set_keymap(mode, lhs, rhs, desc)
  local opts = { noremap = true, silent = true, desc = desc }
  vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

-- Telescope
set_keymap('n', '<leader>ff', ":lua require('telescope.builtin').find_files()<CR>", 'Telescope find files')
set_keymap('n', '<leader>fg', ":lua require('telescope.builtin').live_grep()<CR>", 'Telescope live grep')
set_keymap('n', '<leader>fb', ":lua require('telescope.builtin').buffers()<CR>", 'Telescope buffers')
set_keymap('n', '<leader>fh', ":lua require('telescope.builtin').help_tags()<CR>", 'Telescope help tags')


local function set_keymap(mode, lhs, rhs, desc)
  local opts = { noremap = true, silent = true, desc = desc }
  vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

-- Telescope
set_keymap("n", "<leader>ff", ":lua require('telescope.builtin').find_files()<CR>", "Telescope find files")
set_keymap("n", "<leader>fg", ":lua require('telescope.builtin').live_grep()<CR>", "Telescope live grep")
set_keymap("n", "<leader>fb", ":lua require('telescope.builtin').buffers()<CR>", "Telescope buffers")
set_keymap("n", "<leader>fh", ":lua require('telescope.builtin').help_tags()<CR>", "Telescope help tags")

-- Window navigation and splitting
-- Horizontal split
set_keymap("n", "<C-w>s", ":split<CR>", "Split window horizontally")
-- Vertical split
set_keymap("n", "<C-w>v", ":vsplit<CR>", "Split window vertically")
-- Move between splits
set_keymap("n", "<c-k>", ":wincmd k<CR>", "Move to top window")
set_keymap("n", "<c-j>", ":wincmd j<CR>", "Move to bottom window")
set_keymap("n", "<c-h>", ":wincmd h<CR>", "Move to left window")
set_keymap("n", "<c-l>", ":wincmd l<CR>", "Move to right window")
-- Resize splits
set_keymap("n", "<C-w><", ":vertical resize -2<CR>", "Resize window left")
set_keymap("n", "<C-w>>", ":vertical resize +2<CR>", "Resize window right")
set_keymap("n", "<C-w>+", ":resize +2<CR>", "Resize window up")
set_keymap("n", "<C-w>-", ":resize -2<CR>", "Resize window down")

-- Bufferline Keymaps
-- Navigate between buffers
set_keymap("n", "<Tab>", ":BufferLineCycleNext<CR>", "Navigate to the next buffer")
set_keymap("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", "Navigate to the previous buffer")
-- Buffer close keybindings
set_keymap("n", "<leader>bc", ":BufferLinePickClose<CR>", "Pick a buffer to close")
set_keymap("n", "<leader>bp", ":BufferLineTogglePin<CR>", "Pin or unpin the current buffer")
set_keymap("n", "<leader>br", ":BufferLineCloseRight<CR>", "Close all buffers to the right of the current buffer")
set_keymap("n", "<leader>bl", ":BufferLineCloseLeft<CR>", "Close all buffers to the left of the current buffer")
set_keymap("n", "<leader>bo", ":BufferLineCloseOthers<CR>", "Close all other buffers")
-- Loop to set keymaps for buffer navigation (1 to 9)
for i = 1, 9 do
  set_keymap("n", "<leader>b" .. i, ":BufferLineGoToBuffer " .. i .. "<CR>", "Go to buffer " .. i)
end


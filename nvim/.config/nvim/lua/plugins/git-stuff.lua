return {
  {
    "tpope/vim-fugitive",
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()

      -- Adding keymaps with descriptions
      local keymap = vim.keymap
      local opts = { noremap = true, silent = true }

      -- Keymaps for GitSigns
      opts.desc = "Preview current git hunk"
      keymap.set("n", "<leader>gP", ":Gitsigns preview_hunk<CR>", opts)

      opts.desc = "Stage current hunk"
      keymap.set("n", "<leader>gs", ":Gitsigns stage_hunk<CR>", opts)

      opts.desc = "Undo stage of current hunk"
      keymap.set("n", "<leader>gu", ":Gitsigns undo_stage_hunk<CR>", opts)

      opts.desc = "Reset current hunk"
      keymap.set("n", "<leader>gr", ":Gitsigns reset_hunk<CR>", opts)

      opts.desc = "Reset entire file"
      keymap.set("n", "<leader>gR", ":Gitsigns reset_buffer<CR>", opts)

      opts.desc = "Jump to next hunk"
      keymap.set("n", "<leader>gn", ":Gitsigns next_hunk<CR>", opts)

      opts.desc = "Jump to previous hunk"
      keymap.set("n", "<leader>gp", ":Gitsigns prev_hunk<CR>", opts)

      opts.desc = "Blame current line"
      keymap.set("n", "<leader>gb", ":Gitsigns blame_line<CR>", opts)

      opts.desc = "Show Git status"
      keymap.set("n", "<leader>gs", ":Gitsigns status<CR>", opts)
    end,
  },
}

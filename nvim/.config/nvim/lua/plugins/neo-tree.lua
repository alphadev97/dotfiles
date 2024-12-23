return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },

  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            "node_modules",
          },
        },
      },
      window = {
        position = "current",
      },
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "󰜌",
      },
    })

    -- TODO: hi this is todo

    local keymap = vim.keymap

    -- Keymaps for Neo-tree
    keymap.set("n", "<leader>ee", ":Neotree toggle<CR>", { desc = "Toggle file explorer" })
    keymap.set("n", "<leader>ef", ":Neotree reveal<CR>", { desc = "Toggle file explorer on current file" })
    keymap.set("n", "<leader>ec", ":Neotree close<CR>", { desc = "Collapse file explorer" })
    keymap.set("n", "<leader>er", ":Neotree refresh<CR>", { desc = "Refresh file explorer" })
  end,
}

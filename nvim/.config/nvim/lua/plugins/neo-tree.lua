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
                    visible = true,  -- Show hidden files (dotfiles)
                    hide_dotfiles = false,  -- Do not hide dotfiles
                    hide_by_name = {  -- Add files or folders you want to hide
                        "node_modules",
                    },
                },
            },
        })

        vim.keymap.set("n", "\\", ":Neotree toggle<CR>", {})
        vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
    end,
}


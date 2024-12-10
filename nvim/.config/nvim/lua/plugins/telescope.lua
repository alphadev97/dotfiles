return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
		config = function()
			local builtin = require("telescope.builtin")

			-- Keymaps for Telescope
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {
				noremap = true,
				silent = true,
				desc = "Telescope: Find Files", -- Opens file finder
			})

			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {
				noremap = true,
				silent = true,
				desc = "Telescope: Live Grep", -- Searches for text in project
			})

			vim.keymap.set("n", "<leader>fb", builtin.buffers, {
				noremap = true,
				silent = true,
				desc = "Telescope: Buffers", -- Lists open buffers for easy switching
			})

			vim.keymap.set("n", "<leader>fh", builtin.help_tags, {
				noremap = true,
				silent = true,
				desc = "Telescope: Help Tags", -- Opens help documentation finder
			})

			-- Additional buffer management keymaps
			vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", {
				noremap = true,
				silent = true,
				desc = "Buffer: Close Buffer", -- Closes the current buffer
			})

			vim.keymap.set("n", "<leader>b]", ":bnext<CR>", {
				noremap = true,
				silent = true,
				desc = "Buffer: Next Buffer", -- Switches to the next buffer
			})

			vim.keymap.set("n", "<leader>b[", ":bprevious<CR>", {
				noremap = true,
				silent = true,
				desc = "Buffer: Previous Buffer", -- Switches to the previous buffer
			})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}

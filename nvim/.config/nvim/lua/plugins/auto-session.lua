return {
	"rmagatti/auto-session",
	lazy = false,
	config = function()
		require("auto-session").setup({
			opts = {
				suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
				-- log_level = 'debug',
				session_lens = {
					load_on_setup = true,
					previewer = false,
					mappings = {
						delete_session = { "i", "<C-D>" },
						alternate_session = { "i", "<C-S>" },
						copy_session = { "i", "<C-Y>" },
					},
					theme_conf = {
						border = true,
					},
				},
			},
		})

		-- Add keymaps
		vim.keymap.set("n", "<leader>wl", "<cmd>SessionSearch<CR>", { noremap = true, desc = "List Sessions" })
		vim.keymap.set("n", "<leader>wd", "<cmd>SessionDelete<CR>", { noremap = true, desc = "Delete Current Session" })
		vim.keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { noremap = true, desc = "Save Current Session" })
	end,
}

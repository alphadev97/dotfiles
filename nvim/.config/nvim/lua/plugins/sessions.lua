return {
	"rmagatti/auto-session",
	config = function()
		require("auto-session").setup({
			log_level = "info",
			auto_session_enabled = true,
			auto_save_enabled = true,
			auto_restore_enabled = true,
			auto_session_suppress_dirs = { "~/", "/" }, -- Prevent saving sessions in root directory
			session_lens = {
				load_on_setup = true,
			},
		})

		-- Manual save command
		vim.api.nvim_set_keymap(
			"n",
			"<leader>ss",
			":SaveSession<CR>",
			{ noremap = true, silent = true, desc = "Save Session" }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>sd",
			":DeleteSession<CR>",
			{ noremap = true, silent = true, desc = "Delete Session" }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>sl",
			":RestoreSession<CR>",
			{ noremap = true, silent = true, desc = "Load Session" }
		)
	end,
}

return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	config = function()
		-- Set up the initial colorscheme with transparent mode enabled
		require("gruvbox").setup({
			transparent_mode = true,
			contrast = "hard",
			overrides = {
				Normal = { bg = "none" },
				NormalFloat = { bg = "none" },
			},
		})

		vim.cmd.colorscheme("gruvbox")

		local function toggle_background()
			if vim.g.transparent_mode then
				vim.g.transparent_mode = false
				require("gruvbox").setup({
					transparent_mode = false,
					overrides = {
						Normal = { bg = "#141414" },
						NormalFloat = { bg = "#141414" },
					},
				})
				vim.cmd.colorscheme("gruvbox")
				print("Background set to solid color #141414")
			else
				vim.g.transparent_mode = true
				require("gruvbox").setup({
					transparent_mode = true,
					overrides = {
						Normal = { bg = "none" },
						NormalFloat = { bg = "none" },
					},
				})
				vim.cmd.colorscheme("gruvbox")
				print("Background set to transparent")
			end
		end

		vim.keymap.set("n", "<leader>bg", toggle_background, { noremap = true, silent = true })
	end,
}

return {
	"rose-pine/neovim",
	name = "rose-pine",
	priority = 1000,
	config = function()
		require("rose-pine").setup({
			disable_background = true, -- This will make the background transparent
			disable_float_background = true, -- Optional: makes floating windows transparent as well
		})

		-- Set the colorscheme to rose-pine
		vim.cmd("colorscheme rose-pine")
	end,
}

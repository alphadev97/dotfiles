return {
	"EdenEast/nightfox.nvim",
	name = "nightfox",
	priority = 1000,
	config = function()
		-- Load the nightfox theme with specific settings
		require("nightfox").setup({
			options = {
				transparent = true, -- Enables transparent background
				styles = {
					comments = "italic", -- You can customize other style options like this
				},
			},
		})

		-- Set the colorscheme to carbonfox variant of nightfox
		vim.cmd("colorscheme carbonfox")
	end,
}

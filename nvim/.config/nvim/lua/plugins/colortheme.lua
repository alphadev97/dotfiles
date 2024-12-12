return {
	"ellisonleao/gruvbox.nvim",
	dependencies = "ThePrimeagen/vim-be-good",
	priority = 1000,
	config = function()
		require("gruvbox").setup({
			contrast = "hard", -- Options: "hard", "soft", "medium"
			overrides = {
				Normal = { bg = "none" },
				NormalNC = { bg = "none" },
				SignColumn = { bg = "none" },
				StatusLine = { bg = "none" },
				VertSplit = { bg = "none" },
				TabLine = { bg = "none" },
				TabLineFill = { bg = "none" },
				TabLineSel = { bg = "none" },
				TelescopeNormal = { bg = "none" },
				TelescopeBorder = { bg = "none" },
				TelescopePromptNormal = { bg = "none" },
				TelescopePromptBorder = { bg = "none" },
				TelescopeResultsNormal = { bg = "none" },
				TelescopeResultsBorder = { bg = "none" },
				TelescopePreviewNormal = { bg = "none" },
				TelescopePreviewBorder = { bg = "none" },
			},
		})

		vim.cmd("colorscheme gruvbox")
	end,
}

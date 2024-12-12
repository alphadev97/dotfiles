return {
	"rose-pine/neovim",
	priority = 1000,
	config = function()
		require("rose-pine").setup({
			-- palette = {
			--   main = {
			--     pine = "#d3f8a4",
			--     base = "#202021",
			--   },
			-- },
		})
		vim.cmd("colorscheme rose-pine")

		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
		vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
		vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
		vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })
		vim.api.nvim_set_hl(0, "TabLine", { bg = "none" })
		vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none" })
		vim.api.nvim_set_hl(0, "TabLineSel", { bg = "none" })

		vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" }) -- Main Telescope popup
		vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" }) -- Border around Telescope
		vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none" }) -- Prompt window
		vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "none" }) -- Border around prompt window
		vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "none" }) -- Results window
		vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = "none" }) -- Border around results window
		vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "none" }) -- Preview window
		vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = "none" }) -- Border around preview window
	end,
}

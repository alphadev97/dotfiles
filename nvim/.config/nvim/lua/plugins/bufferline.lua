return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			numbers = "ordinal", -- Show buffer numbers: "none", "ordinal", or "buffer_id"
			close_command = "bdelete! %d", -- Command to close a buffer
			right_mouse_command = "bdelete! %d", -- Right-click to close a buffer
			left_mouse_command = "buffer %d", -- Left-click to go to buffer
			middle_mouse_command = nil, -- Disable middle-click close
			indicator = { icon = "▎", style = "icon" }, -- Custom buffer indicator
			buffer_close_icon = "", -- Icon for closing a buffer
			modified_icon = "●", -- Icon for modified buffers
			close_icon = "", -- Icon for closing all buffers
			show_close_icon = false, -- Hide global close icon
			separator_style = "slant", -- Separator style: "slant", "thick", "thin", or custom
			always_show_bufferline = true, -- Show bufferline even with a single buffer
			diagnostics = "nvim_lsp", -- Show LSP diagnostics in the bufferline
			diagnostics_indicator = function(count, _, _)
				return "(" .. count .. ")" -- Display diagnostics count in buffer
			end,
			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer",
					text_align = "center",
					separator = true,
				},
			},
		},
	},
	config = function()
		-- Set up bufferline options
		require("bufferline").setup({
			options = {
				-- Place all additional options here if needed
			},
		})
	end,
}

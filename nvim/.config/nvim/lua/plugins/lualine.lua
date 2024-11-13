return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
				section_separators = "",
				component_separators = "|",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = {
					{
						"buffers",
						show_filename_only = true, -- Only show the filename in the buffer line
						hide_filename_extension = false,
						show_modified_status = true, -- Show the file modified icon

						mode = 2, -- 0: shows buffer name, 1: relative path, 2: absolute path
						max_length = vim.o.columns * 2 / 3, -- Set maximum length for buffer section

						buffers_color = {
							active = { fg = "#E0D6D7", bg = "#5E4B56" },
							inactive = { fg = "#C5B7B3", bg = "#3E2E39" },
						},
						symbols = {
							modified = " ●", -- Symbol for modified buffers
							alternate_file = "", -- Icon for alternate file
							directory = "", -- Icon for directory buffers
						},
					},
				},
				lualine_x = {
					"filetype",
					{
						"filename",
						path = 1, -- 0: filename only, 1: relative path, 2: absolute path
						symbols = {
							modified = "[+]", -- Symbol for modified files
							readonly = "[-]", -- Symbol for readonly files
							unnamed = "[No Name]", -- Symbol for unnamed buffers
						},
						color = { fg = "#E0D6D7", bg = "#3E2E39" }, -- Customize color for the path display
					},
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {
					{
						"buffers",
						show_filename_only = true,
						buffers_color = {
							active = { fg = "#E0D6D7", bg = "#5E4B56" },
							inactive = { fg = "#C5B7B3", bg = "#3E2E39" },
						},
					},
				},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			extensions = {},
		})
	end,
}

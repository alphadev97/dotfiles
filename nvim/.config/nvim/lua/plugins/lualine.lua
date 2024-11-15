return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "auto",
      },
    })
  end,
}

-- return {
-- 	"nvim-lualine/lualine.nvim",
-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
-- 	config = function()
-- 		require("lualine").setup({
-- 			options = {
-- 				theme = "auto",
-- 				section_separators = "",
-- 				component_separators = "|",
-- 			},
-- 			sections = {
-- 				lualine_a = { "mode" },
-- 				lualine_b = { "branch" },
-- 				lualine_c = {
-- 					{
-- 						"buffers",
-- 						show_filename_only = true,
-- 						hide_filename_extension = false,
-- 						show_modified_status = true,
--
-- 						mode = 2,
-- 						max_length = vim.o.columns * 2 / 3,
--
-- 						buffers_color = {
-- 							active = { fg = "#E0D6D7", bg = "#5E4B56" },
-- 							inactive = { fg = "#C5B7B3", bg = "#3E2E39" },
-- 						},
-- 						symbols = {
-- 							modified = " ●",
-- 							alternate_file = "",
-- 							directory = "",
-- 						},
-- 					},
-- 				},
-- 				lualine_x = {
-- 					"filetype",
-- 					{
-- 						"filename",
-- 						path = 1,
-- 						symbols = {
-- 							modified = "[+]",
-- 							readonly = "[-]",
-- 							unnamed = "[No Name]",
-- 						},
-- 						color = { fg = "#E0D6D7", bg = "#3E2E39" },
-- 					},
-- 				},
-- 				lualine_y = { "progress" },
-- 				lualine_z = { "location" },
-- 			},
-- 			inactive_sections = {
-- 				lualine_a = {},
-- 				lualine_b = {},
-- 				lualine_c = {
-- 					{
-- 						"buffers",
-- 						show_filename_only = true,
-- 						buffers_color = {
-- 							active = { fg = "#E0D6D7", bg = "#5E4B56" },
-- 							inactive = { fg = "#C5B7B3", bg = "#3E2E39" },
-- 						},
-- 					},
-- 				},
-- 				lualine_x = {},
-- 				lualine_y = {},
-- 				lualine_z = {},
-- 			},
-- 			tabline = {},
-- 			extensions = {},
-- 		})
-- 	end,
-- }

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts_extend = { "spec" },
	opts = {
		preset = "modern",
		defaults = {},
		spec = {
			{
				mode = { "n", "v" },
				{ "<leader>s", group = "Window Management", icon = { icon = "", color = "blue" } },
				{ "<leader>t", group = "Tabs Management", icon = { icon = "", color = "green" } },
				{ "<leader>w", group = "Session Management", icon = { icon = "", color = "green" } },
				{ "<leader>e", group = "File Explorer", icon = { icon = "󰈔", color = "green" } },
				{ "<leader>f", group = "Telescope/Fuzzy Finder", icon = { icon = "", color = "green" } },
				{ "<leader>g", group = "Git", icon = { icon = "", color = "orange" } },
				{ "<leader>x", group = "Trouble/Diagnostics", icon = { icon = "", color = "red" } },
				{
					"<leader>b",
					group = "buffer",
					expand = function()
						return require("which-key.extras").expand.buf()
					end,
				},
			},
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Keymaps (which-key)",
		},
		{
			"<c-w><space>",
			function()
				require("which-key").show({ keys = "<c-w>", loop = true })
			end,
			desc = "Window Hydra Mode (which-key)",
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)
		if not vim.tbl_isempty(opts.defaults) then
			LazyVim.warn("which-key: opts.defaults is deprecated. Please use opts.spec instead.")
			wk.register(opts.defaults)
		end
	end,
}

return {
	-- Mason setup for managing LSP, DAP, and Linter installation
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	-- Mason LSP configuration to ensure specific LSP servers are installed
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				auto_install = true,
				ensure_installed = {
					"lua_ls", -- Lua
					"ts_ls", -- TypeScript (used by Next.js)
					"gopls", -- Go
					"html", -- HTML
					"cssls", -- CSS
					"jsonls", -- JSON
					"tailwindcss", -- Tailwind CSS
				},
			})
		end,
	},

	-- Neovim LSP configuration
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			-- Lua LSP configuration
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
					},
				},
			})

			-- TypeScript (Next.js) LSP configuration
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					local ts_utils = require("nvim-lsp-ts-utils")
					ts_utils.setup({})
					ts_utils.setup_client(client)

					local opts = { noremap = true, silent = true }
					vim.keymap.set("n", "gs", ":TSLspOrganize<CR>", opts)
					vim.keymap.set("n", "gr", ":TSLspRenameFile<CR>", opts)
				end,
			})

			-- Go LSP configuration
			lspconfig.gopls.setup({
				capabilities = capabilities,
			})

			-- CSS LSP configuration
			lspconfig.cssls.setup({
				capabilities = capabilities,
			})

			-- Tailwind CSS LSP configuration
			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
				settings = {
					tailwindCSS = {
						experimental = {
							classRegex = {
								-- These regex patterns are used for finding Tailwind CSS classes in JSX, TSX, etc.
								{ "class(?:Name)?\\s*?=\\s*?[\"'`]([^\"'`]*?)[\"'`]" },
							},
						},
					},
				},
			})

			-- General LSP keybindings
			local opts = { noremap = true, silent = true }
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

			-- Diagnostic keybindings
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
			vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
		end,
	},

	-- TypeScript utilities
	{
		"jose-elias-alvarez/nvim-lsp-ts-utils",
	},

	-- Plugin to highlight Tailwind CSS colors
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({
				"css",
				"scss",
				"html",
				"javascript",
				"typescript",
                "javascriptreact",
                "typescriptreact", -- For Next.js JSX/TSX files
            }, {
                    RGB = true, -- #RGB hex codes
                    RRGGBB = true, -- #RRGGBB hex codes
                    names = true, -- "blue" or "red" names
                    RRGGBBAA = true, -- Enable 8-character hex code support (#RRGGBBAA)
                    rgb_fn = true, -- Enable parsing of rgb() functions	
                })
        end,
	},
}

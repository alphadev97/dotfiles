return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "gopls",
          "ts_ls",
          "html",
          "cssls",
          "tailwindcss",
          "jsonls",
          "emmet_ls",
          "eslint",
          "bashls",
          "yamlls",
          "prismals",
          "sqlls",
          "pyright",
          "rust_analyzer",
          "zls",
          "clangd",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- Set diagnostic signs
      local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      -- Setup LSP handlers
      local on_attach = function(_, bufnr)
        local keymap = vim.keymap
        local opts = { buffer = bufnr, silent = true }

        -- LSP references
        opts.desc = "Show LSP references"
        keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)

        -- Go to declaration
        opts.desc = "Go to declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

        -- LSP definitions
        opts.desc = "Show LSP definitions"
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

        -- LSP implementations
        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

        -- LSP type definitions
        opts.desc = "Show LSP type definitions"
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

        -- Buffer diagnostics
        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "gB", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

        -- Line diagnostics
        opts.desc = "Show line diagnostics"
        keymap.set("n", "gl", vim.diagnostic.open_float, opts)

        -- Previous diagnostic
        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "g[", vim.diagnostic.goto_prev, opts)

        -- Next diagnostic
        opts.desc = "Go to next diagnostic"
        keymap.set("n", "g]", vim.diagnostic.goto_next, opts)

        -- Documentation hover
        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "gh", vim.lsp.buf.hover, opts)

        -- Code actions
        opts.desc = "See available code actions"
        keymap.set({ "n", "v" }, "ga", vim.lsp.buf.code_action, opts)

        -- Rename symbol
        opts.desc = "Smart rename"
        keymap.set("n", "grn", vim.lsp.buf.rename, opts)
      end

      -- Setup for installed servers
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
          })
        end,
        ["emmet_ls"] = function()
          lspconfig.emmet_ls.setup({
            capabilities = capabilities,
            filetypes = { "html", "css", "typescriptreact", "javascriptreact" },
            on_attach = on_attach,
          })
        end,
        ["zls"] = function()
          lspconfig.zls.setup({
            capabilities = capabilities,
            filetypes = { "zig", "zir" },
            on_attach = on_attach,
            single_file_support = true,
          })
        end,
        ["lua_ls"] = function()
          lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
                completion = {
                  callSnippet = "Replace",
                },
              },
            },
            on_attach = on_attach,
          })
        end,
        ["pyright"] = function()
          lspconfig.pyright.setup({
            capabilities = capabilities,
            on_attach = on_attach,
          })
        end,
        ["rust_analyzer"] = function()
          lspconfig.rust_analyzer.setup({
            capabilities = capabilities,
            settings = {
              ["rust-analyzer"] = {
                cargo = { allFeatures = true },
                checkOnSave = { command = "clippy" },
              },
            },
            on_attach = on_attach,
          })
        end,
        ["clangd"] = function()
          lspconfig.clangd.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            cmd = { "clangd", "--background-index", "--clang-tidy" }, -- Enable clang-tidy
            filetypes = { "c", "cpp", "objc", "objcpp" },
            single_file_support = true,
          })
        end,
      })

      -- Installing auto
      require("mason-tool-installer").setup({
        ensure_installed = {
          "stylua",
          "prettierd",
          "goimports",
          "golangci-lint",
          "sql-formatter",
          "black",   -- Python formatter
          "mypy",    -- Python type checker
          "ruff",    -- Python linter
          "rustfmt", -- Rust formatter
          "clang-format", -- C++ code formatter
          "cpplint",
        },
      })
    end,
  },
}

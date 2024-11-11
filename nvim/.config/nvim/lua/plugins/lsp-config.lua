return {
  {
    "williamboman/mason.nvim",
    config = function()
      require('mason').setup()
    end
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
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')

      lspconfig.lua_ls.setup({})
      lspconfig.gopls.setup({})
      lspconfig.ts_ls.setup({})     
      lspconfig.html.setup({})         
      lspconfig.cssls.setup({})        
      lspconfig.tailwindcss.setup({})  
      lspconfig.jsonls.setup({})       
      lspconfig.emmet_ls.setup({       
        filetypes = { "html", "css", "typescriptreact", "javascriptreact" }
      })
      lspconfig.eslint.setup({})       
      lspconfig.bashls.setup({})       
      lspconfig.yamlls.setup({})       
      lspconfig.prismals.setup({})     

      -- Keymaps for LSP actions
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end
  }
}


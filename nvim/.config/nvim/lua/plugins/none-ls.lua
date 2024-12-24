return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.diagnostics.golangci_lint,
        null_ls.builtins.formatting.sql_formatter,
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          -- Clear any existing autocmds to avoid duplicates
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })

          -- Create an autocmd to format on save
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ async = false, bufnr = bufnr })
            end,
          })
        end
      end,
    })

    -- Manual format keybinding for fallback or convenience
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format file" })
  end,
}

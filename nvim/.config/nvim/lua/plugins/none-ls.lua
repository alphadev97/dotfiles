return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.diagnostics.golangci_lint,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

    require("mason-tool-installer").setup({
      ensure_installed = {
        "stylua",
        "prettierd",
        "goimports",
        "golangci-lint",
        "black",
        "isort",
      },
    })
  end,
}

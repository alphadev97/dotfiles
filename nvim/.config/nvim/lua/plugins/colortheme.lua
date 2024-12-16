return {
  "EdenEast/nightfox.nvim",
  priority = 1000,
  config = function()
    require("nightfox").setup({})
    vim.cmd("colorscheme nordfox")

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
    vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })
    vim.api.nvim_set_hl(0, "TabLine", { bg = "none" })
    vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none" })
    vim.api.nvim_set_hl(0, "TabLineSel", { bg = "none" })

    vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = "none" })
  end,
}

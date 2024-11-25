return {
  "rose-pine/neovim",
  priority = 1000,
  config = function()
    require("rose-pine").setup({
      palette = {
        main = {
          pine = "#d3f8a4",
          base = "#202021",
        },
      },
    })

    vim.cmd("colorscheme rose-pine")
  end,
}

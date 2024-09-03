return {
  'nvim-lualine/lualine.nvim',
  lazy = false,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local theme = require("lualine.themes.gruvbox")

    theme.normal.c.bg = nil
    theme.insert.c.bg = nil
    theme.visual.c.bg = nil
    theme.replace.c.bg = nil
    theme.command.c.bg = nil

    require("lualine").setup({
      options = {
        theme = theme,
        globalstatus = true,  
      },
    })
  end
}

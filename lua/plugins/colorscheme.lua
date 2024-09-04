return {
  "morhetz/gruvbox",
  lazy = false,
  priority = 9999,
  config = function()
    -- Set the background transparency
    vim.cmd([[
      augroup TransparentBG
        autocmd!
        autocmd ColorScheme * highlight Normal ctermbg=none guibg=none
        autocmd ColorScheme * highlight NonText ctermbg=none guibg=none
        autocmd ColorScheme * highlight LineNr ctermbg=none guibg=none
        autocmd ColorScheme * highlight Folded ctermbg=none guibg=none
        autocmd ColorScheme * highlight EndOfBuffer ctermbg=none guibg=none
      augroup END
    ]])

    -- Set the colorscheme
    vim.cmd("colorscheme gruvbox")
  end
}

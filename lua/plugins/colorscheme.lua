-- return {
--   "morhetz/gruvbox",
--   lazy = false,
--   priority = 9999,
--   config = function()
--     -- Set the background transparency
--     vim.cmd([[
--       augroup TransparentBG
--         autocmd!
--         autocmd ColorScheme * highlight Normal ctermbg=none guibg=none
--         autocmd ColorScheme * highlight NonText ctermbg=none guibg=none
--         autocmd ColorScheme * highlight LineNr ctermbg=none guibg=none
--         autocmd ColorScheme * highlight Folded ctermbg=none guibg=none
--         autocmd ColorScheme * highlight EndOfBuffer ctermbg=none guibg=none
--
--         " Define NotifyBackground highlight group for the Notify plugin
--         autocmd ColorScheme * highlight NotifyBackground guibg=#282828
--       augroup END
--     ]])
--
--     -- Set the colorscheme
--     vim.cmd("colorscheme gruvbox")
--   end
-- }

-- return {
--   {
--     "catppuccin/nvim",
--     lazy = false,
--     name = "catppuccin",
--     priority = 1000,
--     config = function()
--       vim.cmd.colorscheme "catppuccin-mocha"
--     end
--   }
-- }


return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      -- Set the colorscheme
      vim.cmd.colorscheme "catppuccin-mocha"

      -- Make background transparent
      vim.cmd([[
        augroup TransparentBG
          autocmd!
          autocmd ColorScheme * highlight Normal guibg=NONE ctermbg=NONE
          autocmd ColorScheme * highlight NonText guibg=NONE ctermbg=NONE
          autocmd ColorScheme * highlight LineNr guibg=NONE ctermbg=NONE
          autocmd ColorScheme * highlight Folded guibg=NONE ctermbg=NONE
          autocmd ColorScheme * highlight EndOfBuffer guibg=NONE ctermbg=NONE
          autocmd ColorScheme * highlight SignColumn guibg=NONE ctermbg=NONE
          autocmd ColorScheme * highlight StatusLine guibg=NONE ctermbg=NONE
          autocmd ColorScheme * highlight StatusLineNC guibg=NONE ctermbg=NONE
          autocmd ColorScheme * highlight TabLine guibg=NONE ctermbg=NONE
          autocmd ColorScheme * highlight TabLineFill guibg=NONE ctermbg=NONE
          autocmd ColorScheme * highlight TabLineSel guibg=NONE ctermbg=NONE
        augroup END
      ]])
    end
  }
}

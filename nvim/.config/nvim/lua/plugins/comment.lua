return {
  "numToStr/Comment.nvim",
  config = function()
    require("Comment").setup({
      -- Enable basic and extended mappings
      mappings = {
        basic = true, -- Provides `gc` for line comments and `gb` for block comments
        extra = true, -- Adds `gco`, `gcO`, and `gcA` for commenting on new lines and at the end of lines
      },

      -- Customize pre-hooks and post-hooks based on file types
      pre_hook = function(ctx)
        -- Use ts_context_commentstring for commenting based on file type
        if vim.bo.filetype == "typescriptreact" then
          local U = require("Comment.utils")
          local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")
          return ts_context_commentstring.create_pre_hook()(ctx)
        end
      end,

      -- Post-hook example (optional): Log after commenting
      post_hook = function(ctx)
        print("Comment toggled!")
      end,

      -- Other settings
      toggler = {
        line = 'gcc',  -- Toggle line comment
        block = 'gbc', -- Toggle block comment
      },
      opleader = {
        line = 'gc',  -- Operator-pending line comment
        block = 'gb', -- Operator-pending block comment
      },
      padding = true, -- Adds space between comment markers and text
      sticky = true,  -- Retain cursor position after commenting
    })
  end
}

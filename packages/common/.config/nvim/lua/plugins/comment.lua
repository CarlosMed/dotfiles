return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
  opts = {
    pre_hook = function()
      -- for commenting tsx and jsx files
      local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

      ts_context_commentstring.create_pre_hook()
    end,
  },
}
return {
  {
    "kevinhwang91/nvim-ufo",
    lazy = "VeryLazy",
    dependencies = "kevinhwang91/promise-async",
    config = function()
      local ufo = require("ufo")

      -- ufo code folding
      vim.keymap.set("n", "zN", ufo.openAllFolds, { desc = "Open all folds" })
      vim.keymap.set("n", "zM", ufo.closeAllFolds, { desc = "Close all folds" })
      vim.keymap.set("n", "zK", function()
        local winid = ufo.peekFoldedLinesUnderCursor()
        if not winid then
          vim.lsp.buf.hover()
        end
      end, { desc = "Peek Fold" })

      ufo.setup({
        provider_selector = function(bufnr, filetype, buftype)
          return { "lsp", "indent" }
        end,
      })
    end,
  },
}

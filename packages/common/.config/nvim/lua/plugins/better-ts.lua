return {
  "pmizio/typescript-tools.nvim",
  -- enabled = false,
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  event = { "BufReadPre", "BufNewFile" },
  opts = {},
}

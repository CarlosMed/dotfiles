return {
  { "nvim-tree/nvim-web-devicons", lazy = true },
  { "MunifTanjim/nui.nvim", lazy = true },
  { "christoomey/vim-tmux-navigator" }, -- used to navigate vim and tmux
  { "nvim-lua/plenary.nvim", event = { "BufReadPost", "BufWritePost", "BufNewFile" } }, -- needed for many other dependencies
  { "test", dev = true, enabled = false },
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>gdv", "<cmd>DiffviewOpen<cr>", desc = "Diff View Open" },
      { "<leader>gdc", "<cmd>DiffviewClose<cr>", desc = "Diff View Open" },
    },
  },
  { "echasnovski/mini.pairs", event = "VeryLazy", version = false, opts = {} },
  { "mg979/vim-visual-multi", event = { "BufReadPost", "BufWritePost", "BufNewFile" } },
  { "kdheepak/lazygit.nvim", keys = { { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" } } },
  { "luckasRanarison/tailwind-tools.nvim", dependencies = { "nvim-treesitter/nvim-treesitter" }, opts = {} },
}

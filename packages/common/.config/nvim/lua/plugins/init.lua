return {
  { "nvim-tree/nvim-web-devicons", lazy = true },
  { "MunifTanjim/nui.nvim", lazy = true },
  { "christoomey/vim-tmux-navigator" }, -- used to navigate vim and tmux
  { "nvim-lua/plenary.nvim" }, -- needed for many other dependencies
  { "kdheepak/lazygit.nvim", keys = { { "<c-g>", "<cmd>LazyGit<cr>" } } },
  { "sindrets/diffview.nvim", event = "VeryLazy" },
  { "test", dev = true, enabled = false },
}

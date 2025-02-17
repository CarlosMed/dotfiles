return {
  { "nvim-tree/nvim-web-devicons", lazy = true },
  { "MunifTanjim/nui.nvim", lazy = true },
  { "christoomey/vim-tmux-navigator" }, -- used to navigate vim and tmux
  { "nvim-lua/plenary.nvim", event = { "BufReadPost", "BufWritePost", "BufNewFile" } }, -- needed for many other dependencies
  { "test", dev = true, enabled = false },
  { "mg979/vim-visual-multi", event = { "BufReadPost", "BufWritePost", "BufNewFile" } },
  { "luckasRanarison/tailwind-tools.nvim", dependencies = { "nvim-treesitter/nvim-treesitter" }, opts = {} },
}

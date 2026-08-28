return {
  { "nvim-tree/nvim-web-devicons", lazy = true },
  { "MunifTanjim/nui.nvim", lazy = true },
  { "christoomey/vim-tmux-navigator" }, -- used to navigate vim and tmux
  { "nvim-lua/plenary.nvim", event = { "BufReadPost", "BufWritePost", "BufNewFile" } }, -- needed for many other dependencies
  -- { "test", dev = true, enabled = false },
  { "mg979/vim-visual-multi", event = { "BufReadPost", "BufWritePost", "BufNewFile" } },
  { "joosepalviste/nvim-ts-context-commentstring", lazy = true },

  -- Training
  { "m4xshen/hardtime.nvim", lazy = false, dependencies = { "MunifTanjim/nui.nvim" }, opts = {} },
  { "tris203/precognition.nvim", opts = {} },
}

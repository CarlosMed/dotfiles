return {

  "NeogitOrg/neogit",
  -- lazy = true,
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "nvim-telescope/telescope.nvim", -- optional
    "sindrets/diffview.nvim", -- optional
  },
  -- branch = "fix-relative-patches",
  config = true,
  keys = {
    { "<C-g>", "<cmd>Neogit<CR>", "n" },
  },
}

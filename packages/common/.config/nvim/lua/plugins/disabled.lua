-- disabled plugins
return {
  { "tpope/vim-fugitive", enabled = false }, -- Git related plugin
  { "tpope/vim-rhubarb", enabled = false }, -- Git related plugin
  { "tpope/vim-sleuth", enabled = false }, -- Detect tabstop and shiftwidth automatically
  { "m4xshen/hardtime.nvim", enabled = false, opts = {} },
  { "NeogitOrg/neogit", enabled = false, config = true, keys = { { "<C-g>", "<cmd>Neogit<CR>", "n" } } },
}

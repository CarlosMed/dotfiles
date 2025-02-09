return {
  "MagicDuck/grug-far.nvim",
  keys = {
    {
      "<leader>ra",
      function()
        require("grug-far").open()
      end,
      desc = "Replace in folder (Grug-Far)",
    },
  },
  config = function()
    require("grug-far").setup({
      -- options, see Configuration section below
      -- there are no required options atm
      -- engine = 'ripgrep' is default, but 'astgrep' can be specified
    })
  end,
}

return {
  "stevearc/oil.nvim",
  opts = {
    float = {
      max_height = 20,
      max_width = 60,
    },

    view_options = {
      -- Show files and directories that start with "."
      show_hidden = true,
    },
  },
  keys = {
    { "-", "<CMD>Oil --float<CR>", desc = "Open parent directory" },
  },
}

return {
  "ThePrimeagen/harpoon",
  keys = {
    {
      "<leader>hm",
      function()
        require("harpoon.mark").add_file()
        vim.notify("󱡅  marked file")
      end,
    },
    {
      "<leader>hl",
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
    },
  },
}

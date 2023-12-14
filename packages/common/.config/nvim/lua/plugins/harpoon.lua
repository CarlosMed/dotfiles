return {
  "ThePrimeagen/harpoon",
  keys = {
    {
      "<leader>hm",
      function()
        require("harpoon.mark").add_file()
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

return {
  {
    "ThePrimeagen/harpoon",
    config = function()
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")

      vim.keymap.set("n", "<leader>hm", mark.add_file)
      vim.keymap.set("n", "<leader>hl", ui.toggle_quick_menu)

      -- Using Telescope for Harpoon
      -- vim.keymap.set('n', "<C-e>", ':Telescope harpoon marks<CR>')
      -- require("telescope").load_extension('harpoon')
    end,
  },
}

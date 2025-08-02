return {
  "stevearc/oil.nvim",
  -- enabled = false,
  opts = {
    keymaps = {
      ["g?"] = "actions.show_help",
      ["<CR>"] = "actions.select",
      ["<C-h>"] = "actions.select_split",
      ["<C-v>"] = "actions.select_vsplit",
      ["<C-t>"] = "actions.select_tab",
      ["<C-p>"] = "actions.preview",
      ["q"] = "actions.close",
      ["<C-c>"] = "actions.close",
      ["<C-r>"] = "actions.refresh",
      ["-"] = "actions.parent",
      ["_"] = "actions.open_cwd",
      ["`"] = "actions.cd",
      ["~"] = "actions.tcd",
      ["gs"] = "actions.change_sort",
      ["gx"] = "actions.open_external",
      ["g."] = "actions.toggle_hidden",
      ["g\\"] = "actions.toggle_trash",
    },
    use_default_keymaps = false,
    delete_to_trash = true,
    skip_confirm_for_simple_edits = false,

    float = {
      max_height = 20,
      max_width = 60,
    },

    win_options = {
      cursorline = true,
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

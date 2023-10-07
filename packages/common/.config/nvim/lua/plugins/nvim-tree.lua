return {
  {
    "stevearc/oil.nvim",
    opts = {},
    keys = {
      { "-", "<CMD>Oil<CR>", desc = "Open parent directory" },
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    keys = {
      -- Nvim Tree Key Mappings
      { [[<C-e>]], "<cmd>NvimTreeFindFileToggle<CR>", "n" },
    },
    opts = {
      actions = {
        open_file = { quit_on_open = true },
      },
      filters = {
        git_ignored = false,
        custom = { ".DS_Store" },
      },
      log = {
        enable = true,
        types = {
          diagnostics = true,
        },
      },
      diagnostics = {
        enable = true,
        show_on_dirs = false,
        debounce_delay = 50,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      update_focused_file = {
        enable = true,
        update_cwd = true,
        update_root = false,
        ignore_list = {},
      },
      view = {
        width = {},
        side = "right",
        number = true,
        relativenumber = true,
      },
      renderer = {
        highlight_opened_files = "all",
        root_folder_label = ":~:s?$?/..?",
        indent_markers = {
          enable = true,
        },
        icons = {
          git_placement = "after",
        },
      },
    },
  },
}

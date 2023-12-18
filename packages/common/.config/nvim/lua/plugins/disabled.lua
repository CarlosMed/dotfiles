-- disabled plugins
return {
  { "tpope/vim-fugitive", enabled = false }, -- Git related plugin
  { "tpope/vim-rhubarb", enabled = false }, -- Git related plugin
  { "tpope/vim-sleuth", enabled = false }, -- Detect tabstop and shiftwidth automatically
  { "m4xshen/hardtime.nvim", enabled = false, opts = {} },
  { "NeogitOrg/neogit", enabled = false, config = true, keys = { { "<C-g>", "<cmd>Neogit<CR>", "n" } } },
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
    branch = "v3.x",
    opts = {
      filters = { dotfiles = false, git_ignored = false },
      auto_reload_on_write = true,
      view = {
        centralize_selection = false,
        cursorline = true,
        debounce_delay = 15,
        width = {},
        side = "left",
        preserve_window_proportions = false,
        number = true,
        relativenumber = true,
        signcolumn = "yes",
      },
      update_focused_file = { enable = true, update_root = false, ignore_list = {} },
      renderer = {
        add_trailing = false,
        group_empty = false,
        highlight_git = false,
        full_name = false,
        highlight_opened_files = "all",
        highlight_modified = "none",
        root_folder_label = ":~:s?$?/..?",
        indent_width = 2,
        indent_markers = {
          enable = true,
          inline_arrows = true,
          icons = {
            corner = "└",
            edge = "│",
            item = "│",
            bottom = "─",
            none = " ",
          },
        },
      },
    },
    keys = {
      -- Nvim Tree Key Mappings
      { [[<C-e>]], "<cmd>Neotree toggle<CR>", "n" },
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    enabled = false,
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

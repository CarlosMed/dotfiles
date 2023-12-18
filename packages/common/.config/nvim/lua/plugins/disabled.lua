-- disabled plugins
return {
  { "tpope/vim-fugitive", enabled = false }, -- Git related plugin
  { "tpope/vim-rhubarb", enabled = false }, -- Git related plugin
  { "tpope/vim-sleuth", enabled = false }, -- Detect tabstop and shiftwidth automatically
  { "m4xshen/hardtime.nvim", enabled = false, opts = {} },
  { "NeogitOrg/neogit", enabled = false, config = true, keys = { { "<C-g>", "<cmd>Neogit<CR>", "n" } } },
  {
    "rcarriga/nvim-notify", -- A fancy, configurable, notification manager for NeoVim
    enabled = false,
    keys = {
      {
        "<leader>un",
        function()
          require("notify").dismiss({ silent = true, pending = true })
        end,
        desc = "Dismiss all Notifications",
      },
    },
    opts = {
      timeout = 2000,
      stage = "fade",
      fps = 60,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 100 })
      end,
    },
  },
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
  {
    -- A super powerful autopair plugin for Neovim that supports multiple characters.
    "windwp/nvim-autopairs",
    enabled = false,
    event = "VeryLazy",
    config = function()
      -- import nvim-autopairs
      local autopairs = require("nvim-autopairs")

      -- configure autopairs
      autopairs.setup({
        check_ts = true, -- enable treesitter
        ts_config = {
          lua = { "string" }, -- don't add pairs in lua string treesitter nodes
          javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
          java = false, -- don't check treesitter on java
        },
      })

      -- import nvim-autopairs completion functionality
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")

      -- import nvim-cmp plugin (completions plugin)
      local cmp = require("cmp")

      -- make autopairs and completion work together
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
}

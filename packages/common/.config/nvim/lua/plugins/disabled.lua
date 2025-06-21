-- disabled plugins
return {
  { "tpope/vim-fugitive", enabled = false }, -- Git related plugin
  { "tpope/vim-rhubarb", enabled = false }, -- Git related plugin
  { "tpope/vim-sleuth", enabled = false }, -- Detect tabstop and shiftwidth automatically
  { "m4xshen/hardtime.nvim", enabled = true, opts = {} },
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
  {
    "akinsho/bufferline.nvim",
    enabled = false,
    version = "*",
    event = "VeryLazy",
    keys = {
      { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
      { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
      { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete other buffers" },
      { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete buffers to the right" },
      { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete buffers to the left" },
      { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
      { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
    },
    opts = {
      options = {
        themeable = true,
        mode = "buffers",
        separator_style = "slant",
      -- stylua: ignore
      close_command = function(n) require("mini.bufremove").delete(n, false) end,
      -- stylua: ignore
      right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
        diagnostics = "nvim_lsp",
        always_show_bufferline = false,
        diagnostics_indicator = function(_, _, diag)
          local icons = require("null.util").icons.diagnostics
          local ret = (diag.error and icons.Error .. diag.error .. " " or "")
            .. (diag.warning and icons.Warn .. diag.warning or "")
          return vim.trim(ret)
        end,
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            separator = true,
            text_align = "left",
          },
        },
      },
    },
  },
  {
    "nvim-pack/nvim-spectre",
    build = false,
    enabled = false,
    cmd = "Spectre",
    opts = { open_cmd = "noswapfile vnew" },
    -- stylua: ignore
    keys = {
      { "<leader>ra", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
    },
  },
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    enabled = false,
    opts = function()
      local logo = [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣶⢶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⠃⠀⠹⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣿⡿⠛⢷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⡟⠀⠀⠀⢹⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⠏⠀⠀⠈⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⠁⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⡿⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣇⠀⠀⠀⠀⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⡆⠀⠀⠀⠀⢸⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⠀⠀⢀⣼⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣦⡀⠀⠀⣿⣤⠤⠴⠶⠶⠒⠒⠒⠒⠒⠶⠶⠤⣤⣼⣿⣿⠇⠀⣶⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣽⣿⣿⣿⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠛⠀⣤⣿⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠢⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⠃⢀⠠⠤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⠀⠀⠐⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠤⣤⣀⣀⣀⡀⠀⠀⣠⣿⣿⣿⣿⠊⠀⠰⢿⠿⠀⢢⠀⠀⠀⠠⠤⠤⣄⣀⣀⠀⠄⠀⠀⠀⢠⠋⢿⣿⠆⠈⢢⠀⠘⣧⡀⠀⠀⢀⣀⣀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠉⠉⠙⠛⣿⣿⣿⣿⣿⠏⠢⣀⠀⠀⣀⡠⠊⠀⠀⠀⠀⠀⠉⠛⠛⠉⠁⠀⠀⠀⠀⠸⣄⠀⠀⠀⢀⠜⠀⣠⡼⢷⠒⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀
⠉⠙⠛⠒⠒⠒⠲⠶⣶⣿⣿⣿⣿⣯⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠉⠀⠀⠀⠠⠤⠼⢷⡤⠤⠤⠤⠤⠤⠤⠤⠤⠀⠀
⠀⠀⠀⠀⠀⢀⣀⣀⣿⣿⣿⣿⣿⡃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠒⠺⢷⡶⠶⠦⣤⣤⣄⣀⠀⠀⠀
⠀⠒⠛⠛⠉⠉⢉⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢦⡀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⣀⣀⣀⡀⠀⠀⠀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣄⠀⠀⠀⠀⠀⠀
⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⣀⣤⣶⠶⠖⠛⠋⠀⠀⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠙⠓⠲⠦⢤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢦⠀⠀⠀⠀⠀
⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣯⡤⠖⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠙⠳⢦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠳⣄⠀⠀⠀
⢠⣾⣿⣿⣿⣿⣿⣿⣿⣿⠟⠋⠀⢀⣀⣠⣤⣀⠀⠀⠀⠀⠀⠀⣠⣶⣿⣿⣷⣦⣄⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⡀⠀⠈⠛⢦⣄⠀⠀⠀⠀⠀⠀⠀⠈⢳⡄⠀
⣾⣿⣿⣿⣿⣿⣿⣿⡿⠀⠀⢠⣶⣿⠿⠿⠿⠿⢷⠀⠀⠀⠀⠾⠿⠿⠛⠉⠉⠙⠛⠿⣷⠀⠀⠀⣠⣶⡿⠿⠟⠿⣿⣷⡀⠀⠀⠙⢷⣄⠀⠀⡄⠀⠀⠀⠀⢻⡄
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠁⠀⠀⠀⠀⠈⠁⠀⠁⠀⠀⠀⠀⠀⠁    ]]

      logo = string.rep("\n", 8) .. logo .. "\n"

      local opts = {
        theme = "doom",
        hide = {
          -- this is taken care of by lualine
          -- enabling this messes up the actual laststatus setting after loading a file
          statusline = false,
        },
        config = {
          header = vim.split(logo, "\n"),
          -- stylua: ignore
          center = {
            { action = "Telescope find_files",                                     desc = " Find file",       icon = " ", key = "f" },
            { action = "ene | startinsert",                                        desc = " New file",        icon = " ", key = "n" },
            { action = "Telescope oldfiles",                                       desc = " Recent files",    icon = " ", key = "r" },
            { action = "Telescope live_grep",                                      desc = " Find text",       icon = " ", key = "g" },
            { action = "Telescope find_files cwd=~/.config/nvim" ,                 desc = " Config",          icon = " ", key = "c" },
            { action = "Leet",                                                     desc = " Leet Code",       icon = " ", key = "t" },
            { action = "Lazy",                                                     desc = " Lazy",            icon = "󰒲 ", key = "l" },
            { action = "Mason",                                                    desc = " Mason",           icon = " ", key = "m" },
            { action = "qa",                                                       desc = " Quit",            icon = " ", key = "q" },
          },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
          end,
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
        button.key_format = "  %s"
      end

      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "DashboardLoaded",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      return opts
    end,
  },
  {
    "echasnovski/mini.bufremove",
    enabled = false,
    keys = {
      {
        "<leader>bd",
        function()
          local bd = require("mini.bufremove").delete
          if vim.bo.modified then
            local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
            if choice == 1 then -- Yes
              vim.cmd.write()
              bd(0)
            elseif choice == 2 then -- No
              bd(0, true)
            end
          else
            bd(0)
          end
        end,
        desc = "Delete Buffer",
      },
        -- stylua: ignore
        { "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)" },
    },
  },
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
      -- timeout = 2000,
      timeout = 100,
      stage = "fade_in_slide_out",
      top_down = true,
      render = "simple",
      fps = 120,
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
    "echasnovski/mini.indentscope",
    enabled = false,
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    opts = {
      -- symbol = "▏",
      symbol = "│",
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
  {
    "stevearc/dressing.nvim",
    lazy = true,
    enabled = false,
    opts = {
      input = {
        win_options = {
          -- Use a purple-ish border.
          winhighlight = "FloatBorder:LspFloatWinBorder",
          winblend = 5,
        },
      },
      select = {
        trim_prompt = false,
        get_config = function(opts)
          if opts.kind == "codeaction" then
            -- Cute and compact code action menu.
            return {
              backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },
              -- backend = "builtin",
              builtin = {
                relative = "cursor",
                max_height = 0.33,
                min_height = 5,
                max_width = 0.40,
                mappings = { ["q"] = "Close" },
                win_options = {
                  -- Same UI as the input field.
                  winhighlight = "FloatBorder:LspFloatWinBorder,DressingSelectIdx:LspInfoTitle,MatchParen:Ignore",
                  winblend = 5,
                },
              },
            }
          end

          local winopts = { height = 0.6, width = 0.5 }

          -- Smaller menu for snippet choices.
          if opts.kind == "luasnip" then
            opts.prompt = "Snippet choice: "
            winopts = { height = 0.35, width = 0.3 }
          end

          -- Add a colon to the prompt if it doesn't have one.
          if opts.prompt and not opts.prompt:match(":%s*$") then
            opts.prompt = opts.prompt .. ": "
          end

          -- Fallback to fzf-lua.
          return {
            backend = "fzf_lua",
            fzf_lua = { winopts = winopts },
          }
        end,
      },
    },
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.select(...)
      end
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.input(...)
      end
    end,
  },
  {
    "kylechui/nvim-surround",
    enabled = false,
    event = { "BufReadPre", "BufNewFile" },
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = true,
  },
  {
    "numToStr/Comment.nvim",
    enabled = false,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    config = function()
      -- import comment plugin safely
      local comment = require("Comment")

      local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

      -- enable comment
      comment.setup({
        -- for commenting tsx and jsx files
        pre_hook = ts_context_commentstring.create_pre_hook(),
      })
    end,
  },
}

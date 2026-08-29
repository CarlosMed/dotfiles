return {
  -- Treesitter is a new parser generator tool that we can
  -- use in Neovim to power faster and more accurate
  -- syntax highlighting.
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    -- Highlighting and indent are handled natively by Neovim via
    -- `vim.treesitter.start()` (see lua/core/autocmds.lua). Building
    -- parsers from source on the `main` branch requires `tree-sitter-cli`.
    -- `install()` is idempotent: it is a no-op for already-installed parsers.
    config = function()
      require("nvim-treesitter").install({
        "angular",
        "awk",
        "bash",
        "c",
        "cpp",
        "css",
        "csv",
        "diff",
        "dockerfile",
        "fish",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "go",
        "gomod",
        "gowork",
        "gosum",
        "gotmpl",
        "graphql",
        "html",
        "http",
        "javascript",
        "jq",
        "jsdoc",
        "json",
        "lua",
        "luadoc",
        "luap",
        "make",
        "markdown",
        "markdown_inline",
        "prisma",
        "python",
        "query",
        "regex",
        "ruby",
        "scheme",
        "scss",
        "sql",
        "svelte",
        "templ",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "vue",
        "xml",
        "yaml",
      }):wait(300000)
    end,
    -- Incremental selection: nvim-treesitter `main` removed the old
    -- incremental_selection module; Neovim provides the same functionality
    -- natively via `vim.treesitter.select()`.
    keys = {
      {
        "<c-space>",
        function()
          vim.treesitter.select("parent")
        end,
        desc = "Start treesitter selection",
      },
      {
        "<c-space>",
        function()
          vim.treesitter.select("parent")
        end,
        desc = "Expand selection",
        mode = { "x", "o" },
      },
      {
        "<bs>",
        function()
          vim.treesitter.select("child")
        end,
        desc = "Shrink selection",
        mode = { "x", "o" },
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    deps = { "nvim-treesitter/nvim-treesitter" },
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    config = function()
      local ts_select = require("nvim-treesitter-textobjects.select")
      local ts_move = require("nvim-treesitter-textobjects.move")

      vim.keymap.set({ "x", "o" }, "af", function()
        ts_select.select_textobject("@function.outer", "textobjects")
      end, { desc = "a function" })
      vim.keymap.set({ "x", "o" }, "if", function()
        ts_select.select_textobject("@function.inner", "textobjects")
      end, { desc = "inner function" })
      vim.keymap.set({ "x", "o" }, "ac", function()
        ts_select.select_textobject("@class.outer", "textobjects")
      end, { desc = "a class" })
      vim.keymap.set({ "x", "o" }, "ic", function()
        ts_select.select_textobject("@class.inner", "textobjects")
      end, { desc = "inner class" })
      vim.keymap.set({ "x", "o" }, "aa", function()
        ts_select.select_textobject("@parameter.outer", "textobjects")
      end, { desc = "a parameter" })
      vim.keymap.set({ "x", "o" }, "ia", function()
        ts_select.select_textobject("@parameter.inner", "textobjects")
      end, { desc = "inner parameter" })

      vim.keymap.set({ "n", "x", "o" }, "]f", function()
        ts_move.goto_next_start("@function.outer", "textobjects")
      end, { desc = "Next function start" })
      vim.keymap.set({ "n", "x", "o" }, "[f", function()
        ts_move.goto_previous_start("@function.outer", "textobjects")
      end, { desc = "Previous function start" })
      vim.keymap.set({ "n", "x", "o" }, "]F", function()
        ts_move.goto_next_end("@function.outer", "textobjects")
      end, { desc = "Next function end" })
      vim.keymap.set({ "n", "x", "o" }, "[F", function()
        ts_move.goto_previous_end("@function.outer", "textobjects")
      end, { desc = "Previous function end" })
      vim.keymap.set({ "n", "x", "o" }, "]c", function()
        ts_move.goto_next_start("@class.outer", "textobjects")
      end, { desc = "Next class start" })
      vim.keymap.set({ "n", "x", "o" }, "[c", function()
        ts_move.goto_previous_start("@class.outer", "textobjects")
      end, { desc = "Previous class start" })
      vim.keymap.set({ "n", "x", "o" }, "]C", function()
        ts_move.goto_next_end("@class.outer", "textobjects")
      end, { desc = "Next class end" })
      vim.keymap.set({ "n", "x", "o" }, "[C", function()
        ts_move.goto_previous_end("@class.outer", "textobjects")
      end, { desc = "Previous class end" })
    end,
  },

  -- Automatically add closing tags for HTML and JSX
  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    opts = {
      opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = true,
      },
      aliases = {
        ["vue"] = "html",
        ["templ"] = "html",
      },
    },
  },
}

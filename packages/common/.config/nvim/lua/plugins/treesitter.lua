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
    dependencies = {
      -- TEMPORARILY DISABLED: nvim-treesitter-textobjects is incompatible with main branch
      -- {
      --   "nvim-treesitter/nvim-treesitter-textobjects",
      --   config = function()
      --     -- When in diff mode, we want to use the default
      --     -- vim text objects c & C instead of the treesitter ones.
      --     local move = require("nvim-treesitter.textobjects.move") ---@type table<string,fun(...)>
      --     local configs = require("nvim-treesitter.configs")
      --     for name, fn in pairs(move) do
      --       if name:find("goto") == 1 then
      --         move[name] = function(q, ...)
      --           if vim.wo.diff then
      --             local config = configs.get_module("textobjects.move")[name] ---@type table<string,string>
      --             for key, query in pairs(config or {}) do
      --               if q == query and key:find("[%]%[][cC]") then
      --                 vim.cmd("normal! " .. key)
      --                 return
      --               end
      --             end
      --           end
      --           return fn(q, ...)
      --         end
      --       end
      --     end
      --   end,
      -- },
    },
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    keys = {
      { "<c-space>", desc = "Increment selection" },
      { "<bs>", desc = "Decrement selection", mode = "x" },
    },
    ---@type TSConfig
    ---@diagnostic disable-next-line: missing-fields
    opts = {
      highlight = {
        enable = true,
        -- BREAKING CHANGE: disable_range_vim_regex_modifiers might be needed
        -- disable = function(lang, buf)
        --   local max_filesize = 100 * 1024 -- 100 KB
        --   local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        --   if ok and stats and stats.size > max_filesize then
        --     return true
        --   end
        -- end,
      },
      indent = { enable = true },
      ensure_installed = {
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
        "jsonc",
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
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      -- REMOVED: context_commentstring (no longer needed or auto-handled)
      -- If you still need it, install the plugin separately

      -- REMOVED: textobjects config (plugin disabled for main branch compatibility)
      -- Re-enable when nvim-treesitter-textobjects updates for main branch
    },
    ---@param opts TSConfig
    config = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        ---@type table<string, boolean>
        local added = {}
        opts.ensure_installed = vim.tbl_filter(function(lang)
          if added[lang] then
            return false
          end
          added[lang] = true
          return true
        end, opts.ensure_installed)
      end
      require("nvim-treesitter.configs").setup(opts)
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

return {
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>ot", "<cmd>ObsidianToday<CR>", desc = "Obsidian Today" },
      { "<leader>oy", "<cmd>ObsidianToday -1<CR>", desc = "Obsidian Yesterday" },
    },
    opts = {
      disable_frontmatter = false,
      ui = {
        enable = false,
      },
      workspaces = {
        {
          name = "personal",
          path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Le Notes",
        },
      },
      templates = {
        folder = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Le Notes/99 - Assets/Templates",
        -- date_format = "%Y-%m-%d",
        -- time_format = "%H:%M",
        -- A map for custom variables, the key should be the variable and the value a function
        substitutions = {},
      },
      daily_notes = {
        -- Optional, if you keep daily notes in a separate directory.
        folder = "06 - Daily",
        -- Optional, if you want to change the date format for the ID of daily notes.
        -- date_format = "%Y-%m-%d",
        -- Optional, if you want to change the date format of the default alias of daily notes.
        -- alias_format = "%B %-d, %Y",
        -- Optional, default tags to add to each new daily note created.
        -- default_tags = { "daily-notes" },
        -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
        template = "daily.md",
      },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {},
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
  },
  {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    opts = {
      -- add options here
      -- or leave it empty to use the default settings
    },
    keys = {
      -- suggested keymap
      { "<leader>P", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
    },
  },
}

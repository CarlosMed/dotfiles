return {
  -- LSP Configuration & Plugins
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    "williamboman/mason-lspconfig.nvim",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neoconf.nvim",                  cmd = "Neoconf", config = false },
    { "j-hui/fidget.nvim",                   tag = "legacy",  opts = {},     event = "VeryLazy" }, -- Useful status updates for LSP
    {
      "williamboman/mason.nvim",
      opts = {
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      },
    }, -- enable mason and configure icons
    {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      opts = {
        ensure_installed = {
          "prettierd",
          "stylua",
          "eslint_d",
          "goimports",
          "gofumpt",
          "gomodifytags",
          "gotests",
          "iferr",
          "impl",
          "templ",
        },
        auto_update = false,
        run_on_start = true,
      },
    },
  },

  config = function()
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    local servers = {
      -- emmet_language_server = {},
      bashls = {},
      cssls = {},
      custom_elements_ls = {},
      docker_compose_language_service = {},
      dockerls = {},
      emmet_ls = {},
      golangci_lint_ls = {},
      gopls = {},
      html = {},
      jsonls = {},
      lua_ls = {},
      marksman = {},
      sqlls = {},
      tailwindcss = {},
      ts_ls = {},
      vtsls = {},
      vue_ls = {},
      yamlls = {},
    }

    require("mason-lspconfig").setup {
      ensure_installed = vim.tbl_keys(servers),
      automatic_enable = {
        "gopls",
        "html",
        "lua_ls",
        "ts_ls",
        -- "vtsls",
        "vue_ls",
      }
    }
  end,
}

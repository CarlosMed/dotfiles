return {
  "stevearc/conform.nvim",
  lazy = true,
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  cmd = "ConformInfo",
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({
          formatters = { "injected" },
        })
      end,
      mode = { "n", "v" },
      desc = "Format Injected Langs",
    },
  },
  opts = {
    format = {
      -- timeout_ms = 1000,
      async = true,
      quite = false,
      lsp_fallback = true,
    },
    formatters_by_ft = {
      javascript = { { "prettierd", "prettier" } },
      typescript = { { "prettierd", "prettier" } },
      javascriptreact = { { "prettierd", "prettier" } },
      typescriptreact = { { "prettierd", "prettier" } },
      svelte = { { "prettierd", "prettier" } },
      css = { { "prettierd", "prettier" } },
      html = { { "prettierd", "prettier" } },
      json = { { "prettierd", "prettier" } },
      yaml = { { "prettierd", "prettier" } },
      markdown = { { "prettierd", "prettier" } },
      graphql = { { "prettierd", "prettier" } },
      lua = { "stylua" },
    },
    format_after_save = {
      lsp_fallback = true,
      async = true,
      -- timeout_ms = 500,
    },
    formatters = {
      injected = { options = { ignore_errors = true } },
    },
  },
}

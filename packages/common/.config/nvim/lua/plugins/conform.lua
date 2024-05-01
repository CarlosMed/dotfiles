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
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      svelte = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      graphql = { "prettier" },
      lua = { "stylua" },
    },
    format_on_save = {
      lsp_fallback = true,
      async = true,
      -- timeout_ms = 500,
    },
    formatters = {
      injected = { options = { ignore_errors = true } },
    },
  },
}

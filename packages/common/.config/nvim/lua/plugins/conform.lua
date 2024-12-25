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
    formatters_by_ft = {
      javascript = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      javascriptreact = { "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { "prettierd", "prettier", stop_after_first = true },
      svelte = { "prettierd", "prettier", stop_after_first = true },
      css = { "prettierd", "prettier", stop_after_first = true },
      html = { "prettierd", "prettier", stop_after_first = true },
      json = { "prettierd", "prettier", stop_after_first = true },
      yaml = { "prettierd", "prettier", stop_after_first = true },
      markdown = { "cbfmt", "prettierd", "prettier", "markdownlint", stop_after_first = true },
      graphql = { "prettierd", "prettier", stop_after_first = true },
      lua = { "stylua" },
      htmlangular = { "prettierd" },
      jsonc = { "prettierd" },
      scss = { "prettierd" },
      vue = { "prettierd" },
      fish = { "fish_indent" },
      sh = { "shfmt", "shellharden" },
      bash = { "shfmt", "shellharden" },
      go = { "goimports", "gofumpt" }, -- gofmt, gomodifytags
    },
    format_on_save = {
      lsp_fallback = true,
      timeout_ms = 500,
    },
    formatters = {
      injected = { options = { ignore_errors = true } },
    },
  },
}

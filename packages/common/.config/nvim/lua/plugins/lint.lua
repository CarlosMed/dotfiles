return {
  "mfussenegger/nvim-lint",
  enabled = false,
  lazy = true,
  event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      bash = { "shellcheck" },
      docker = { "hadolint" },
      go = { "golangcilint" },
      fish = { "fish" },
      javascript = { "eslint_d", "oxlint" },
      javascriptreact = { "eslint_d" },
      json = { "jsonlint" },
      markdown = { "markdownlint" },
      editorconfig = { "editorconfig-checker" },
      sh = { "shellcheck" },
      svelte = { "eslint_d" },
      typescript = { "eslint_d", "oxlint" },
      typescriptreact = { "eslint_d" },
      vue = { "eslint_d", "oxlint" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    lint.linters.oxlint = {
      name = "oxlint", -- cargo install --features allocator --git https://github.com/oxc-project/oxc oxlint
      cmd = "oxlint",
      stdin = false,
      args = { "--format", "unix" },
      stream = "stdout",
      ignore_exitcode = true,
      parser = require("lint.parser").from_errorformat("%f:%l:%c: %m", {
        source = "oxlint",
        severity = vim.diagnostic.severity.WARN,
      }),
    }

    vim.keymap.set("n", "<leader>cl", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}

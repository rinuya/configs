-- keymap is <Leader>fm
require("conform").setup({
    formatters_by_ft = {
      lua       = { "stylua" },
      python    = { "isort", "black" },
      go        = { "goimports", "gofmt" },
      javascript = { "prettierd", "prettier", stop_after_first = true },
    },
  })
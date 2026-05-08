local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff_format" },
    c = { "clang-format" },
    cpp = { "clang-format" },
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    json = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    markdown = {},
  },

  formatters = {
    ruff_format = {
      command = vim.fn.stdpath "data" .. "/mason/packages/ruff/venv/bin/ruff",
      args = { "format", "--force-exclude", "--line-length", "120", "--stdin-filename", "$FILENAME", "-" },
      stdin = true,
    },
    ["clang-format"] = {
      command = vim.fn.stdpath "data" .. "/mason/packages/clang-format/venv/bin/clang-format",
      args = { "--assume-filename", "$FILENAME", "--style={BasedOnStyle: llvm, ColumnLimit: 120}" },
      stdin = true,
    },
    prettier = {
      command = "npx",
      args = { "prettier", "--write", "--print-width", "120", "$FILENAME" },
      stdin = false,
      timeout_ms = 3000,
    },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options

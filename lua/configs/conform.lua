local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff_format" },
    c = { "clang-format" },
    cpp = { "clang-format" },
    javascript = { "prettierd" },
    javascriptreact = { "prettierd" },
    typescript = { "prettierd" },
    typescriptreact = { "prettierd" },
    json = { "prettierd" },
    html = { "prettierd" },
    css = { "prettierd" },
    markdown = { "prettierd" },
  },

  formatters = {
    ruff_format = {
      command = vim.fn.stdpath "data" .. "/mason/packages/ruff/venv/bin/ruff",
      args = { "format", "--force-exclude", "--stdin-filename", "$FILENAME", "-" },
      stdin = true,
    },
    ["clang-format"] = {
      command = vim.fn.stdpath "data" .. "/mason/packages/clang-format/venv/bin/clang-format",
      args = { "--assume-filename", "$FILENAME" },
      stdin = true,
    },
    prettierd = {
      command = "prettierd",
      args = { "$FILENAME" },
      stdin = true,
    },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options

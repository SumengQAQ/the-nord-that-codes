local orig_on_attach = require("nvchad.configs.lspconfig").on_attach

require("nvchad.configs.lspconfig").defaults()

-- 覆盖 on_attach，移除不需要的快捷键、注册自定义 LSP 映射
local LspConfig = require("nvchad.configs.lspconfig")
local old_on_attach = LspConfig.on_attach
LspConfig.on_attach = function(client, bufnr)
  old_on_attach(client, bufnr)
  pcall(vim.keymap.del, "n", "<leader>D", { buffer = bufnr })
  pcall(vim.keymap.del, "n", "<leader>ra", { buffer = bufnr })
  pcall(vim.keymap.del, "n", "<leader>wa", { buffer = bufnr })
  pcall(vim.keymap.del, "n", "<leader>wr", { buffer = bufnr })
  pcall(vim.keymap.del, "n", "<leader>wl", { buffer = bufnr })
  vim.keymap.set("n", "<leader>er", vim.lsp.buf.rename, { buffer = bufnr, desc = "LSP rename" })
end

-- 配置 pyright 根目录标记（支持更多项目类型）
vim.lsp.config('pyright', {
  root_markers = { '.git', 'pyproject.toml', 'setup.py', 'requirements.txt', 'config.toml', '.venv' }
})

local servers = { "html", "cssls", "pyright", "clangd", "tsserver", "eslint", "jsonls", "tailwindcss" }
vim.lsp.enable(servers)

-- venv-lsp 自动检测虚拟环境
require("venv-lsp").setup({
  disable_auto_venv = false,
})

-- read :h vim.lsp.config for changing options of lsp servers 

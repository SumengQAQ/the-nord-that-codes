require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "pyright", "clangd", "tsserver", "eslint", "jsonls", "tailwindcss" }
vim.lsp.enable(servers)

-- venv-lsp 自动检测虚拟环境 (Neovim 0.11+ 无需额外配置)
require("venv-lsp").setup()

-- read :h vim.lsp.config for changing options of lsp servers 

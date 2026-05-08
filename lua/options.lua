require "nvchad.options"

-- add yours here!

local o = vim.o
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set clipboard+=unnamedplus")
vim.g.clipboard = {
  name = "win32yank-wsl",
  copy = {
    ["+"] = { "clip.exe" },
    ["*"] = { "clip.exe" },
  },
  paste = {
    ["+"] = { "powershell.exe", "-c", "[Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace('`r', ''))" },
    ["*"] = { "powershell.exe", "-c", "[Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace('`r', ''))" },
  },
  cache_enabled = true,
}

-- 面包屑导航（navic）
vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

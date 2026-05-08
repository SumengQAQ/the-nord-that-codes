require "nvchad.options"

-- add yours here!

local o = vim.o
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set clipboard+=unnamedplus")
vim.g.clipboard = {
  name = "win32yank-wsl",
  copy = {
    ["+"] = { "win32yank.exe", "-i", "--crlf" },
    ["*"] = { "win32yank.exe", "-i", "--crlf" },
  },
  paste = {
    ["+"] = { "win32yank.exe", "-o", "--lf" },
    ["*"] = { "win32yank.exe", "-o", "--lf" },
  },
  cache_enabled = false,
}

-- 面包屑导航（navic）
vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

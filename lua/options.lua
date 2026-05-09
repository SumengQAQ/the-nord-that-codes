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

-- 禁用 plenary.curl 的代理检测
vim.g.plenary_curl_no_proxy = true

-- 清掉 nvim 内的代理环境变量
vim.env.http_proxy = nil
vim.env.https_proxy = nil
vim.env.HTTP_PROXY = nil
vim.env.HTTPS_PROXY = nil

-- 浮动窗口不显示行号
vim.api.nvim_create_autocmd("FileType", {
  pattern = "conform-info",
  callback = function()
    vim.wo.number = false
    vim.wo.relativenumber = false
  end,
})

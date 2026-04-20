require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Windows 风格快捷键
-- 全选
map("n", "<C-a>", "gg0vG$y", { desc = "select all" })
map("i", "<C-a>", "<Esc>gg0vG$y", { desc = "select all" })

-- 撤销/重做
map("n", "<C-z>", "u", { desc = "undo" })
map("i", "<C-z>", "<Esc>u", { desc = "undo" })
map("n", "<C-y>", "<C-r>", { desc = "redo" })
map("i", "<C-y>", "<Esc><C-r>", { desc = "redo" })

-- 复制/剪切/粘贴
map({ "n", "v" }, "<C-c>", '"+y', { desc = "copy" })
map({ "n", "v" }, "<C-x>", '"+d', { desc = "cut" })
map("i", "<C-c>", "<Esc>" .. '"+y', { desc = "copy" })
map("i", "<C-x>", "<Esc>" .. '"+d', { desc = "cut" })
map("i", "<C-v>", "<C-r>+", { desc = "paste" })
map({ "n", "v" }, "<C-v>", "p", { desc = "paste" })

-- 保存
map("n", "<C-s>", "<cmd>w<CR>", { desc = "save file" })
map("i", "<C-s>", "<Esc><cmd>w<CR>a", { desc = "save file" })

-- 删除整行 (类似 PyCharm Ctrl+Y)
map("n", "<C-d>", "dd", { desc = "delete line" })
map("i", "<C-d>", "<Esc>dd", { desc = "delete line" })

-- 向上/向下移动行
map("n", "<A-S-Up>", ":m -2<CR>", { desc = "move line up" })
map("n", "<A-S-Down>", ":m +1<CR>", { desc = "move line down" })
map("i", "<A-S-Up>", "<Esc>:m -2<CR>a", { desc = "move line up" })
map("i", "<A-S-Down>", "<Esc>:m +1<CR>a", { desc = "move line down" })

-- 复制当前行向下/向上
map("n", "<C-S-Down>", "yyp", { desc = "duplicate line down" })
map("n", "<C-S-Up>", "yyP", { desc = "duplicate line up" })
map("i", "<C-S-Down>", "<Esc>yyp", { desc = "duplicate line down" })
map("i", "<C-S-Up>", "<Esc>yyP", { desc = "duplicate line up" })

-- 调试快捷键
map("n", "<leader>dc", ":lua require('dap').continue()<CR>", { desc = "debug continue" })
map("n", "<leader>do", ":lua require('dap').step_over()<CR>", { desc = "debug step over" })
map("n", "<leader>di", ":lua require('dap').step_into()<CR>", { desc = "debug step into" })
map("n", "<leader>dj", ":lua require('dap').step_out()<CR>", { desc = "debug step out" })
map("n", "<leader>dt", ":lua require('dap').toggle_breakpoint()<CR>", { desc = "debug toggle breakpoint" })
map("n", "<leader>dl", ":lua require('dap').list_breakpoints()<CR>", { desc = "debug list breakpoints" })
map("n", "<leader>du", ":lua require('dapui').toggle()<CR>", { desc = "debug ui toggle" })

-- Menu 菜单
map({ "n", "v" }, "<RightMouse>", function()
  require("menu").open("default", { mouse = true })
end, { desc = "Open menu" })
map("n", "<C-t>", function()
  require("menu").open("default")
end, { desc = "Open menu" })

-- C/C++ 编译运行快捷键
-- 编译当前文件
map("n", "<leader>cc", function()
  local file = vim.fn.expand("%")
  local output = vim.fn.expand("%:r")
  vim.cmd("!gcc " .. file .. " -o " .. output .. " -Wall -g")
end, { desc = "compile C file" })

-- 编译并运行当前文件
map("n", "<leader>cr", function()
  local file = vim.fn.expand("%")
  local output = vim.fn.expand("%:r")
  vim.cmd("!gcc " .. file .. " -o " .. output .. " -Wall -g && ./" .. output)
end, { desc = "compile and run C file" })

-- 仅运行（假设已编译）
map("n", "<leader>rr", function()
  local output = "./" .. vim.fn.expand("%:r")
  vim.cmd("!" .. output)
end, { desc = "run compiled program" })

-- 测试工具
map("n", "<leader>tt", function()
  require("neotest").run.run()
end, { desc = "test run" })
map("n", "<leader>tf", function()
  require("neotest").run.run(vim.fn.expand("%"))
end, { desc = "test file" })
map("n", "<leader>ts", function()
  require("neotest").summary.toggle()
end, { desc = "test summary" })

-- 注释切换 (使用gcc/gc，更符合Vim习惯)
map("n", "gcc", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", { desc = "toggle comment line" })
map("x", "gc", "<cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", { desc = "toggle comment selection" })

-- 代码检查
map("n", "<leader>ll", "<cmd>Lint<CR>", { desc = "run linter" })

-- 颜色高亮
map("n", "<leader>uc", "<cmd>ColorizerToggle<CR>", { desc = "toggle colorizer" })

require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- 普通模式减少缩进快捷键
map("n", "<leader><", "<<", { desc = "deindent line" })

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
-- du 调试UI开关（先关文件树再开调试UI，保持文件树在最左侧）
map("n", "<leader>du", function()
  require("dapui").toggle()
end, { desc = "debug ui toggle" })

-- Menu 菜单
map({ "n", "v" }, "<RightMouse>", function()
  require("menu").open("default", { mouse = true })
end, { desc = "Open menu" })
map("n", "<C-t>", function()
  require("menu").open("default")
end, { desc = "Open menu" })

-- 运行脚本（智能判断文件类型）
map("n", "<leader>r", function()
  local ft = vim.bo.filetype
  local file = vim.fn.expand("%")
  
  -- 先保存文件
  vim.cmd("write")
  
  if ft == "python" then
    -- 使用水平分割终端运行 Python 文件
    vim.cmd("belowright split | resize 10 | term python3 " .. vim.fn.fnameescape(file))
  elseif ft == "c" or ft == "cpp" then
    local base = vim.fn.expand("%:r")
    vim.cmd("belowright split | resize 10 | term gcc " .. vim.fn.fnameescape(file) .. " -o " .. vim.fn.fnameescape(base) .. " && ./" .. vim.fn.fnameescape(base))
  elseif ft == "javascript" then
    vim.cmd("belowright split | resize 10 | term node " .. vim.fn.fnameescape(file))
  else
    print("Unsupported filetype: " .. ft)
  end
end, {     desc = "run program" })
map("n", "<leader>er", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "rename" })

-- 测试工具
map("n", "<leader>tr", function()
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

-- 便签工具 (fusen.nvim)
local fusen = require("fusen")
map("n", "<leader>na", fusen.add_mark, { desc = "add note" })
map("n", "<leader>nc", fusen.clear_mark, { desc = "clear note" })
map("n", "<leader>nC", fusen.clear_buffer, { desc = "clear buffer notes" })
map("n", "<leader>nn", fusen.next_mark, { desc = "next note" })
map("n", "<leader>np", fusen.prev_mark, { desc = "prev note" })
map("n", "<leader>nl", fusen.list_marks, { desc = "list notes" })
-- Mermaid 渲染（mmdc CLI 生成 PNG）
map("n", "<leader>m", function()
  local file = vim.fn.expand("%")
  local out = vim.fn.expand("%:r") .. ".png"
  vim.cmd("w")
  vim.fn.system({ "mmdc", "-i", file, "-o", out })
  vim.notify("Mermaid rendered: " .. out, vim.log.levels.INFO)
end, { desc = "mermaid render to png" })

-- 颜色高亮
map("n", "<leader>uc", "<cmd>ColorizerToggle<CR>", { desc = "toggle colorizer" })

-- 删除 NvChad 默认的快捷键
pcall(vim.keymap.del, "n", "<leader>ch")
pcall(vim.keymap.del, "n", "<leader>cm")
pcall(vim.keymap.del, "n", "<leader>D")
pcall(vim.keymap.del, "n", "<leader>b")
pcall(vim.keymap.del, "n", "<leader>x")
pcall(vim.keymap.del, "n", "<leader>gt")
pcall(vim.keymap.del, "n", "<leader>ds")
pcall(vim.keymap.del, "n", "<leader>e")
pcall(vim.keymap.del, "n", "<leader>fm")
pcall(vim.keymap.del, "n", "<leader>ma")
pcall(vim.keymap.del, "n", "<leader>pt")
pcall(vim.keymap.del, "n", "<leader>rn")
pcall(vim.keymap.del, "n", "<leader>uc")
pcall(vim.keymap.del, "n", "<leader>wK")
pcall(vim.keymap.del, "n", "<leader>wk")
pcall(vim.keymap.del, "n", "<leader>th")
pcall(vim.keymap.del, "n", "<leader><")

-- Git 操作
-- 已移至上面统一的 pcall 删除块
map("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { desc = "git status" })
map("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "git terminal" })
map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "git commits" })
map("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", { desc = "git branches" })
map("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { desc = "git diff view" })
map("n", "<leader>gl", "<cmd>Telescope git_log<CR>", { desc = "git log" })

-- which-key 分组描述
require("which-key").add({
  { "<leader>a", group = "AI", icon = { icon = "󰭹 ", color = "cyan" } },
  { "<leader>u", group = "undo", icon = { icon = " ", color = "cyan" } },
  { "<leader>c", group = "todo", icon = { icon = " ", color = "cyan" } },
  { "<leader>d", group = "debug" },
  { "<leader>e", group = "edit", icon = { icon = " ", color = "cyan" } },
  { "<leader>f", group = "telescope" },
  { "<leader>g", group = "git" },
  { "<leader>n", group = "note", icon = { icon = "󰈐 ", color = "yellow" } },
  { "<leader>r", group = "run", icon = { icon = "▶ ", color = "green" } },
  { "<leader>m", group = "mermaid", icon = { icon = " ", color = "cyan" } },
  { "<leader>t", group = "test", icon = { icon = " ", color = "green" } },
})

-- TODO 注释管理
map("n", "<leader>ct", "<cmd>TodoTelescope<CR>", { desc = "find todos" })
map("n", "<leader>cl", "<cmd>TodoLocList<CR>", { desc = "find todo loclist" })
map("n", "<leader>cq", "<cmd>TodoQuickFix<CR>", { desc = "todo quickfix" })
map("n", "<leader>cb", "<cmd>TodoTelescope keywords=TODO,BUG,FIX,HACK,WARN,PERF,NOTE,TEST<CR>", { desc = "find todo browse" })
map("n", "<leader>cn", function()
  require("todo-comments").jump_next()
end, { desc = "find next todo" })
map("n", "<leader>cp", function()
  require("todo-comments").jump_prev()
end, { desc = "find prev todo" })
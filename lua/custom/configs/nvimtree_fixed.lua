-- 修复NvimTree需要按两次Enter的问题

-- 首先加载NvChad的默认配置
local nvtree = require "nvchad.configs.nvimtree"

-- 基本过滤器设置保持不变
nvtree.filters = {
  dotfiles = true,
  git_ignored = true,
  custom = { "node_modules" },
}

-- 关键修复：修改视图映射配置
nvtree.view = nvtree.view or {}
nvtree.view.mappings = {
  list = {
    { key = "<CR>", action = "edit" },
    { key = "o",    action = "edit" },
    { key = "<2-LeftMouse>", action = "edit" },
    { key = "<C-e>", action = "edit_in_place" },
    { key = "O",    action = "edit_no_picker" },
    { key = "<C-]>", action = "cd" },
    { key = "<C-v>", action = "vsplit" },
    { key = "<C-x>", action = "split" },
    { key = "<C-t>", action = "tabnew" },
    { key = "<",    action = "prev_sibling" },
    { key = ">",    action = "next_sibling" },
    { key = "P",    action = "parent_node" },
    { key = "<BS>", action = "close_node" },
    { key = "<Tab>", action = "preview" },
    { key = "K",    action = "first_sibling" },
    { key = "J",    action = "last_sibling" },
    { key = "I",    action = "toggle_git_ignored" },
    { key = "H",    action = "toggle_dotfiles" },
    { key = "R",    action = "refresh" },
    { key = "a",    action = "create" },
    { key = "d",    action = "remove" },
    { key = "D",    action = "trash" },
    { key = "r",    action = "rename" },
    { key = "<C-r>", action = "full_rename" },
    { key = "x",    action = "cut" },
    { key = "c",    action = "copy" },
    { key = "p",    action = "paste" },
    { key = "y",    action = "copy_name" },
    { key = "Y",    action = "copy_path" },
    { key = "gy",   action = "copy_absolute_path" },
    { key = "[c",   action = "prev_git_item" },
    { key = "]c",   action = "next_git_item" },
    { key = "-",    action = "dir_up" },
    { key = "q",    action = "close" },
    { key = "g?",   action = "toggle_help" },
  }
}

-- 禁用确认对话框
nvtree.actions = nvtree.actions or {}
nvtree.actions.open_file = {
  quit_on_open = true,  -- 打开文件后自动退出
  window_picker = {
    enable = false,     -- 禁用窗口选择器
  },
}

-- 禁用所有确认对话框
nvtree.trash = {
  cmd = "trash",
  require_confirm = false,
}

return nvtree
local nvtree = require "nvchad.configs.nvimtree"

nvtree.filters = {
  dotfiles = true,
  git_ignored = true,
  custom = { "node_modules" },
}

-- 防止重复打开报错
nvtree.disable_window_picker = false
nvtree.hijack_netrw = true
nvtree.reload_on_bufenter = true

-- 优化打开行为
nvtree.actions = {
  open_file = {
    quit_on_open = false,
    window_picker = {
      enable = false,
    },
  },
}

return nvtree
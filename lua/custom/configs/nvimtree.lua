local nvtree = require "nvchad.configs.nvimtree"

nvtree.filters = {
  dotfiles = true,
  git_ignored = true,
  custom = { "node_modules" },
}

return nvtree
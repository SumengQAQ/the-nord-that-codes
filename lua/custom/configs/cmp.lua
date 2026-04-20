local cmp = require "cmp"

local nvchad_cmp = require("nvchad.configs.cmp")

local mapping = {
  ["<Tab>"] = cmp.mapping.confirm {
    behavior = cmp.ConfirmBehavior.Insert,
    select = true,
  },
  ["<Up>"] = cmp.mapping.select_prev_item(),
  ["<Down>"] = cmp.mapping.select_next_item(),
  ["<CR>"] = cmp.mapping.confirm {
    behavior = cmp.ConfirmBehavior.Insert,
    select = true,
  },
}

nvchad_cmp.mapping = mapping
nvchad_cmp.sources = {
  { name = "codeium", priority = 100 },
  { name = "nvim_lsp", priority = 90 },
  { name = "luasnip", priority = 80 },
  { name = "buffer", priority = 50 },
}

-- 限制补全窗口最多显示10条，隐藏滚动条
nvchad_cmp.window = {
  completion = {
    max_height = 10,
    scrollbar = false,
  },
}

return nvchad_cmp
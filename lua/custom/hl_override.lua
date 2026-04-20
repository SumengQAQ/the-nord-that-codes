-- Nord主题冰蓝色边框配置
-- 简单版，不依赖复杂模块

local M = {}

-- 应用冰蓝色边框
function M.apply_nord_borders()
  -- Nord主题冰蓝色 #88C0D0
  local nord_ice_blue = "#88C0D0"
  local nord_dark_bg = "#2E3440"
  local nord_light_bg = "#3B4252"
  local nord_text = "#D8DEE9"
  
  -- 只设置最重要的边框颜色
  vim.api.nvim_set_hl(0, "FloatBorder", {
    fg = nord_ice_blue,
    bg = nord_dark_bg,
  })
  
  vim.api.nvim_set_hl(0, "NormalFloat", {
    fg = nord_text,
    bg = nord_dark_bg,
  })
  
  -- 可选：设置其他相关的高亮
  vim.api.nvim_set_hl(0, "PmenuSel", {
    fg = nord_dark_bg,
    bg = nord_ice_blue,
  })
  
  vim.api.nvim_set_hl(0, "TabLineSel", {
    fg = nord_dark_bg,
    bg = nord_ice_blue,
  })
end

-- 安全应用，不打印任何信息
if vim.g.colors_name == "nord" then
  pcall(M.apply_nord_borders)
end

return M
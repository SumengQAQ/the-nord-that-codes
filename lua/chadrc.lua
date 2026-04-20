-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "nord",
}

M.ui = {
	statusline = {
		theme = "vscode_colored",
		separator_style = "default",
	},
}

M.term = {
	float = {
		relative = "editor",
		row = 0.3,
		col = 0.25,
		width = 0.5,
		height = 0.4,
		border = "rounded",
	},
}

-- M.nvdash = { load_on_startup = true }

return M

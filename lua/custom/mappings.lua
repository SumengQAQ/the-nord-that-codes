-- NvChad Menu configuration
vim.keymap.set({ "n", "v" }, "<RightMouse>", function()
  require("menu").open("default", { mouse = true })
end, { noremap = true, silent = true })

vim.keymap.set("n", "<C-t>", function()
  require("menu").open("default")
end, { noremap = true, silent = true, desc = "Open menu" })
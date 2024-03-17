require("pml68.remap")
require("pml68.lazy")

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.opt.relativenumber = true
vim.cmd("set nu")

vim.opt.clipboard = "unnamedplus"

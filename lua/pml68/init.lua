require("pml68.remap")
require("pml68.lazy")

vim.opt.rnu = true
vim.opt.nu = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.clipboard = "unnamedplus"

vim.opt.termguicolors = true

vim.opt.whichwrap:append "<>[]hl"

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

require("pml68.remap")
require("pml68.lazy")

vim.opt.rnu = true
vim.opt.nu = true

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.colorcolumn = "80"

vim.opt.scrolloff = 10

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.clipboard = "unnamedplus"

vim.opt.termguicolors = true

vim.opt.whichwrap:append "<>[]hl"

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
































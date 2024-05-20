vim.o.rnu = true
vim.o.nu = true

vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.expandtab = true

vim.o.mouse = ""

vim.o.smartindent = true

vim.o.swapfile = false

vim.o.scrolloff = 10

vim.o.hlsearch = true
vim.o.incsearch = true

vim.o.clipboard = "unnamedplus"

vim.opt.whichwrap:append "<>[]hl"

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"

vim.env.PATH = vim.fn.stdpath "data" .. "/mason/bin" .. ":" .. vim.env.PATH

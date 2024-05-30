vim.o.rnu = true
vim.o.nu = true

vim.o.conceallevel = 2

vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.expandtab = true

vim.o.mouse = "a"

vim.o.smartindent = true

vim.o.swapfile = false

vim.o.scrolloff = 10
vim.o.cursorline = false

vim.o.hlsearch = true
vim.o.incsearch = true

vim.o.clipboard = "unnamedplus"

vim.opt.whichwrap:append "<>[]hl"

vim.o.foldmethod = "expr"
vim.o.foldenable = false
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"

vim.env.PATH = vim.fn.stdpath "data" .. "/mason/bin" .. ":" .. vim.env.PATH

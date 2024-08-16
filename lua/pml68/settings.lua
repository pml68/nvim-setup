vim.o.rnu = true
vim.o.nu = true

vim.o.conceallevel = 2

vim.o.laststatus = 3

local function branch_name()
  local branch = vim.fn.system("git branch --show-current 2> /dev/null | tr -d '\n'")
  if branch ~= "" then
    return " " .. branch
  else
    return ""
  end
end

vim.api.nvim_create_autocmd({ "FileType", "BufEnter", "FocusGained" }, {
  callback = function()
    vim.b.branch_name = branch_name()
  end
})

function Status_Line()
  return " "
      .. "%<"
      .. " %f "
      .. vim.b.branch_name
      .. " %m"
      .. " %="
      .. " [%{&filetype}]"
      .. " %l:%c "
end

vim.opt.statusline = "%{%v:lua.Status_Line()%}"

vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.expandtab = true

vim.o.mouse = "a"

vim.o.smartindent = true

vim.o.swapfile = false
vim.o.backup = false

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

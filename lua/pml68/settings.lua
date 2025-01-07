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

local function diagnostics()
  local warns = vim.diagnostic.get(nil, { severity = vim.diagnostic.severity.WARN })
  local errors = vim.diagnostic.get(nil, { severity = vim.diagnostic.severity.ERROR })
  return string.format("[ %d| %d]", #warns, #errors)
end

local function get_attached_clients()
  local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
  if #buf_clients == 0 then
    return "LSP Inactive"
  end

  local buf_client_names = {}

  for _, client in pairs(buf_clients) do
    table.insert(buf_client_names, client.name)
  end

  local unique_client_names = {}
  for _, client_name_target in ipairs(buf_client_names) do
    local is_duplicate = false
    for _, client_name_compare in ipairs(unique_client_names) do
      if client_name_target == client_name_compare then
        is_duplicate = true
      end
    end
    if not is_duplicate then
      table.insert(unique_client_names, client_name_target)
    end
  end

  local client_names_str = table.concat(unique_client_names, ", ")
  local language_servers = string.format("[%s]", client_names_str)

  return language_servers
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
      .. " %= "
      .. diagnostics()
      .. " "
      .. get_attached_clients()
      .. " [%{&filetype}]"
      .. " %l:%c "
end

vim.opt.statusline = "%{%v:lua.Status_Line()%}"

vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.expandtab = true

vim.o.mouse = ""

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

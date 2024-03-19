vim.g.mapleader = " "
vim.keymap.set("n", "<C-n>", vim.cmd.Ex)
vim.keymap.set("n", "<leader>gB", "<cmd> Git blame <CR>")
vim.keymap.set("v", "<leader>cs", "<cmd> Silicon <CR>")
vim.keymap.set("n", "<leader>cp", ":!xclip -sel clip -target image/png -i 2024*.png && rm 2024*.png <CR>")
vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<CR>")
vim.keymap.set("n", "<leader>n", "<cmd> set nu! <CR>")
vim.keymap.set("n", "<leader>rn", "<cmd> set rnu! <CR>")

-- keyboard problems (temporary)
vim.keymap.set("n", "<leader>s", function()
  local pos = vim.api.nvim_win_get_cursor(0)[2]
  local line = vim.api.nvim_get_current_line()
  local nline = line:sub(0, pos) .. "<" .. line:sub(pos + 1)
  vim.api.nvim_set_current_line(nline)
end)

-- switch between windows
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

-- close current buffer
vim.keymap.set("n", "<leader>x", "<cmd> bd <CR>")

-- termtoggle
vim.keymap.set("n", "<leader>h", "<cmd> ToggleTerm direction=horizontal <CR>")
vim.keymap.set("n", "<leader>v", "<cmd> ToggleTerm direction=vertical <CR>")

-- Diagnostics, LSP
vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>') 

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  end
})

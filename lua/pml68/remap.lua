vim.g.mapleader = " "
vim.keymap.set("n", "<C-n>", vim.cmd.Ex)
vim.keymap.set("n", "<leader>gB", "<cmd> Git blame <CR>")
vim.keymap.set("v", "<leader>cs", "<cmd> Silicon <CR>")
vim.keymap.set("n", "<leader>cp", ":!xclip -sel clip -target image/png -i 2024*.png && rm 2024*.png <CR>")
vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<CR>")

function starting()
  local pos = vim.api.nvim_win_get_cursor(0)[2]
  local line = vim.api.nvim_get_current_line()
  local nline = line:sub(0, pos) .. "<" .. line:sub(pos + 1)
  vim.api.nvim_set_current_line(nline)
end

vim.keymap.set("n", "<leader>s", "<cmd> lua starting() <CR>")

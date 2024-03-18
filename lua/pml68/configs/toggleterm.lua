local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
	cmd = "lazygit",
	hidden = true,
	direction = "float",
  float_opts = {
    border = "double",
  },
})

function _lazygit_toggle()
  lazygit:toggle()
end

vim.keymap.set("n", "<leader>g", "<cmd> lua _lazygit_toggle() <CR>", {noremap = true, silent = true})

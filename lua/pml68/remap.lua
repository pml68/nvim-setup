vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<leader>n", "<cmd>set nu!<CR>")
vim.keymap.set("n", "<leader>rn", "<cmd>set rnu!<CR>")
vim.keymap.set("n", "<Esc>", "<cmd>nohl<CR>")
vim.keymap.set("n", "<leader>x", "<cmd>bd<CR>")
vim.keymap.set("n", "<leader>fo", "=ap")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Switch between windows
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

-- VimTex
vim.keymap.set("n", "<leader>ll", "<cmd>VimtexCompile<CR>")
vim.keymap.set("n", "<leader>vl", "<cmd>VimtexView<CR>")

-- Undotree
vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<CR>")

-- Gitsigns
vim.keymap.set("n", "<leader>gB", "<cmd>Git blame<CR>")

-- Screenkey
vim.keymap.set("n", "<leader>sk", "<cmd>Screenkey<CR>")

-- Telescope
vim.keymap.set('n', '<leader>ff', "<cmd>Telescope find_files<CR>", {})
vim.keymap.set('n', '<leader>fw', "<cmd>Telescope live_grep<CR>", {})
vim.keymap.set('n', '<leader>fb', "<cmd>Telescope buffers<CR>", {})
vim.keymap.set('n', '<leader>fh', "<cmd>Telescope help_tags<CR>", {})
vim.keymap.set('n', '<leader>fz', "<cmd>Telescope current_buffer_fuzzy_find<CR>", {})
vim.keymap.set('n', '<leader>fg', "<cmd>Telescope git_files<CR>", {})

-- Toggleterm
vim.keymap.set("n", "<leader>h", "<cmd>ToggleTerm direction=horizontal<CR>")
vim.keymap.set("n", "<leader>v", "<cmd>ToggleTerm direction=vertical<CR>")

-- Diagnostics, LSP
vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }

    vim.keymap.set('n', '<leader>gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.keymap.set({ 'n', 'x' }, '<S-f>', '<cmd>lua vim.lsp.buf.format({async = true})<CR>', opts)
    vim.keymap.set('n', 'gc', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  end
})

-- Netrw (u/vonheikemen)
vim.api.nvim_create_autocmd('filetype', {
  pattern = 'netrw',
  desc = 'Better mappings for netrw',
  callback = function()
    local bind = function(lhs, rhs)
      vim.keymap.set('n', lhs, rhs, { remap = true, buffer = true })
    end

    bind('a', '%')

    bind('r', 'R')
  end
})

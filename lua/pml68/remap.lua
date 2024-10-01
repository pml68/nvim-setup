vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", "<cmd>Oil --float<CR>")
vim.keymap.set("n", "<leader>n", "<cmd>set nu!<CR>")
vim.keymap.set("n", "<leader>rn", "<cmd>set rnu!<CR>")
vim.keymap.set("n", "<Esc>", "<cmd>nohl<CR>")
vim.keymap.set("n", "<leader>x", "<cmd>bd<CR>")
vim.keymap.set("n", "<leader>fo", "=ap")
vim.keymap.set("n", "<leader>b", "<cmd>!chmod 755 %<CR>", { silent = true })
vim.keymap.set("n", "<A-J>", "ddp")
vim.keymap.set("n", "<A-K>", "ddkP")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>sl", "<cmd>exec \"normal i\".nr2char(getchar()).\"\\e\"<CR>")
vim.keymap.set("n", "<leader>sc", "<cmd>exec \"normal a\".nr2char(getchar()).\"\\e\"<CR>")

-- u/soer9459
vim.keymap.set('n', '<leader>,',
  function()
    local cursor = vim.api.nvim_win_get_cursor(0)
    vim.cmd('norm A;')
    vim.api.nvim_win_set_cursor(0, cursor)
  end,
  { noremap = true, silent = true })

-- Switch between windows
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<Tab>", "<C-w>w")

-- Switch between panes
vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>")
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>")
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>")
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>")

-- VimTex
vim.keymap.set("n", "<leader>ll", "<cmd>VimtexCompile<CR>")
vim.keymap.set("n", "<leader>vl", "<cmd>VimtexView<CR>")

-- Screenkey
vim.keymap.set("n", "<leader>sk", "<cmd>Screenkey<CR>")

-- Telescope
vim.keymap.set('n', '<leader>ff', "<cmd>Telescope find_files<CR>", {})
vim.keymap.set('n', '<leader>fw', "<cmd>Telescope live_grep<CR>", {})
vim.keymap.set('n', '<leader>fb', "<cmd>Telescope buffers<CR>", {})
vim.keymap.set('n', '<leader>fh', "<cmd>Telescope help_tags<CR>", {})
vim.keymap.set('n', '<leader>fz', "<cmd>Telescope current_buffer_fuzzy_find<CR>", {})
vim.keymap.set('n', '<leader>fg', "<cmd>Telescope git_files<CR>", {})

-- Diagnostics, LSP
vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }

    vim.keymap.set('n', '<leader>gh', '<cmd>lua vim.diagnostic.goto_next({ float = { border = "rounded" } })<CR>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.keymap.set({ 'n', 'x' }, '<S-f>', '<cmd>lua vim.lsp.buf.format({async = true})<CR>', opts)
    vim.keymap.set('n', 'gc', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    -- u/Blan_11
    vim.keymap.set('n', '<leader>lh', function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, { silent = true })
  end
})

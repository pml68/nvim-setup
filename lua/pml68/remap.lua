vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", "<cmd>Oil --float<CR>")
vim.keymap.set("n", "<leader>n", "<cmd>set nu!<CR>")
vim.keymap.set("n", "<leader>rn", "<cmd>set rnu!<CR>")
vim.keymap.set("n", "<Esc>", "<cmd>nohl<CR>")
vim.keymap.set("n", "<leader>x", "<cmd>bd<CR>")
vim.keymap.set("n", "<leader>fb", "=ap")
vim.keymap.set("n", "<leader><leader>", "<cmd>!chmod 755 %<CR>", { silent = true })
vim.keymap.set("n", "<A-J>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-K>", ":m .-2<CR>==")
vim.keymap.set("i", "<A-J>", ":m .+1<CR>==")
vim.keymap.set("i", "<A-K>", ":m .-2<CR>==")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<A-a>", "<C-a>")
vim.keymap.set("n", "<A-x>", "<C-x>")
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

-- Cellular Automaton
vim.keymap.set("n", "<leader>gol", "<cmd>CellularAutomaton game_of_life<CR>")

-- Color picker
vim.keymap.set("n", "<leader>cc", "<cmd>CccPick<CR>")

-- VimTex
vim.keymap.set("n", "<leader>ll", "<cmd>VimtexCompile<CR>")
vim.keymap.set("n", "<leader>vl", "<cmd>VimtexView<CR>")

-- Go
vim.keymap.set("n", "<leader>gj", "<cmd>GoTagAdd json<CR>")
vim.keymap.set("n", "<leader>gy", "<cmd>GoTagAdd yaml<CR>")
vim.keymap.set("n", "<leader>ge", "<cmd>GoIfErr<CR>")
vim.keymap.set("n", "<leader>gt", "<cmd>GoMod tidy<CR>")

-- Screenkey
vim.keymap.set("n", "<leader>sk", "<cmd>Screenkey<CR>")

-- Telescope
vim.keymap.set('n', '<leader>ff', "<cmd>Telescope find_files<CR>", {})
vim.keymap.set('n', '<leader>fw', "<cmd>Telescope live_grep<CR>", {})
vim.keymap.set('n', '<leader>fo', "<cmd>Telescope buffers<CR>", {})
vim.keymap.set('n', '<leader>fh', "<cmd>Telescope help_tags<CR>", {})
vim.keymap.set('n', '<leader>fz', "<cmd>Telescope current_buffer_fuzzy_find<CR>", {})
vim.keymap.set('n', '<leader>fg', "<cmd>Telescope git_files<CR>", {})
vim.keymap.set('n', '<leader>fd', "<cmd>Telescope diagnostics<CR>", {})
vim.keymap.set('n', '<leader>ft', function()
  local telescope = require("telescope.builtin")
  local handle = io.popen("rg 'TODO'")
  local result = handle:read("*a")
  handle:close()

  if result:match("[^\r\n]+") == nil then
    local todo_files = {}

    local files_handle = io.popen("rg --files -g 'TODO.{md,txt}'")
    local files_result = files_handle:read("*a")
    files_handle:close()

    for file in files_result:gmatch("[^\r\n]+") do
      table.insert(todo_files, file)
    end

    if #todo_files > 0 then
      telescope.find_files({
        prompt_title = "Choose TODO file",
        cwd = vim.fn.getcwd(),
        search_dirs = todo_files
      })
    else
      vim.api.nvim_echo({ { "Failed to find any to-dos", "WarningMsg" } }, true, {})
    end
  else
    telescope.grep_string({ search = "TODO" })
  end
end, { noremap = true, silent = true })

-- Diagnostics, LSP
vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', 'gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
vim.keymap.set('n', 'gn', '<cmd>lua vim.diagnostic.goto_next()<CR>')

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }

    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.keymap.set({ 'n', 'x' }, '<S-f>', '<cmd>lua vim.lsp.buf.format({async = true})<CR>', opts)
    -- u/Blan_11
    vim.keymap.set('n', '<leader>lh', function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, { silent = true, buffer = event.buf })
  end
})

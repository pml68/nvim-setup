return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("gitsigns").setup({
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "󰍵" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "│" },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        vim.keymap.set("n", "<leader>gb", gs.blame_line, { buffer = bufnr })
        vim.keymap.set("n", "<leader>gr", gs.reset_hunk, { buffer = bufnr })
      end,
    })
  end
}

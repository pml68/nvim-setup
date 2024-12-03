return {
  {
    "uga-rosa/ccc.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      highlighter = {
        auto_enable = true,
        lsp = true,
      },
    },
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    lazy = false,
    config = function()
      require("rose-pine").setup({
        styles = {
          transparency = true,
          italic = false,
        },
        highlight_groups = {
          StatusLine = { fg = "iris", bg = "iris", blend = 10 },
          StatusLineNC = { fg = "subtle", bg = "surface" },
        },
      })
      vim.cmd("colorscheme rose-pine")
    end
  },
}

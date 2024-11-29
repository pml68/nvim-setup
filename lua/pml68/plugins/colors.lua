return {
  {
    "brenoprata10/nvim-highlight-colors",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-highlight-colors").setup({
        render = 'background',
        enable_tailwind = true,
      })
    end
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

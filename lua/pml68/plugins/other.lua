return {
  {
    "NStefan002/visual-surround.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = true,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "artemave/workspace-diagnostics.nvim",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("ibl").setup()
    end
  },
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
  },
}

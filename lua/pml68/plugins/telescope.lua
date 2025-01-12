return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.6",
  cmd = "Telescope",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  opts = {
    pickers = {
      find_files = {
        hidden = true,
        find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/**" },
      },
    },
  },
}

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
        find_command = { "rg", "--files", "--hidden" },
      },
    },
  },
}

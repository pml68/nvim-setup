return {
  {
    "andweeb/presence.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      main_image = "file",
      log_level = "debug",
    },
  },
  {
    "NStefan002/screenkey.nvim",
    cmd = "Screenkey",
    version = "*",
    config = true
  },
  {
    "eandrju/cellular-automaton.nvim",
    cmd = "CellularAutomaton",
  },
}

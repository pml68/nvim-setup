return {
  "stevearc/oil.nvim",
  cmd = "Oil",
  config = function()
    require("oil").setup({
      keymaps = {
        ["<C-h>"] = false,
      },
      view_options = {
        show_hidden = true,
        natural_order = true,
        is_always_hidden = function(name, _)
          return name == '.git' or name == "node_modules" or name == "target"
        end
      },
      float = {
        padding = 2,
        max_width = 50,
        max_height = 0,
        border = "single",
        win_options = {
          winblend = 0,
        },
      },
      skip_confirm_for_simple_edits = true,
      default_file_explorer = true,
    })
  end
}

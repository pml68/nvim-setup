return {
  "nvimdev/guard.nvim",
  dependencies = {
    "nvimdev/guard-collection"
  },
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local ft = require("guard.filetype")

    ft("c,cpp,h"):fmt("clang-format")
    ft("json"):fmt({
      cmd = "jq",
      stdin = true
    })
    vim.g.guard_config = {
      fmt_on_save = true,
      lsp_as_default_formatter = true
    }
  end
}

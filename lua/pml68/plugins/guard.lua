return {
  "nvimdev/guard.nvim",
  dependencies = {
    "nvimdev/guard-collection"
  },
  ft = { "c", "cpp", "h", "toml", "json", "go", "lua" },
  config = function()
    local ft = require("guard.filetype")

    ft("c,cpp,h"):fmt("clang-format")
    ft("toml"):fmt("taplo")
    ft("json"):fmt("jq")

    ft("go"):fmt({
      cmd = "golines",
      args = { "--max-len=80", "--base-formatter=gofumpt" },
      stdin = true,
    })

    vim.g.guard_config = {
      fmt_on_save = true,
      lsp_as_default_formatter = true,
    }
  end
}

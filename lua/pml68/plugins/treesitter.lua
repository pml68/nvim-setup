return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")

    local ensure_installed = {
      "asm",
      "bash",
      "c",
      "c_sharp",
      "cpp",
      "css",
      "git_config",
      "gitattributes",
      "gitcommit",
      "gitignore",
      "glsl",
      "go",
      "gomod",
      "gosum",
      "gotmpl",
      "gowork",
      "hare",
      "html",
      "java",
      "javascript",
      "json",
      "kotlin",
      "lua",
      "make",
      "markdown",
      "markdown_inline",
      "python",
      "rust",
      "scss",
      "svelte",
      "typescript",
      "vim",
      "vimdoc",
      "yaml",
    }

    ts.install(ensure_installed, {
      max_jobs = 12,
      summary = false,
    })

    local ignore = {
      "checkhealth",
      "lazy",
      "mason",
      "TelescopePrompt",
    }

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("EnableTreesitterHighlighting", { clear = true }),
      callback = function(event)
        if vim.tbl_contains(ignore, event.match) then
          return
        end

        pcall(function() vim.treesitter.start(event.buf) end)
      end
    })
  end
}

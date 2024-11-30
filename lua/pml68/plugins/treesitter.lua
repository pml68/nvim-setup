return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "asm",
        "c",
        "cpp",
        "c_sharp",
        "lua",
        "kotlin",
        "java",
        "bash",
        "html",
        "scss",
        "css",
        "typescript",
        "javascript",
        "svelte",
        "python",
        "rust",
        "markdown",
        "markdown_inline",
        "yaml",
        "json",
        "glsl",
        "make",
        "gitignore",
        "gitattributes",
        "gitcommit",
        "go",
        "gosum",
        "gomod",
        "gotmpl",
        "gowork",
      },
      highlight = {
        enable = true
      }
    })
  end
}

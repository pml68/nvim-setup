return {
  -- JSON
  {
    "b0o/schemastore.nvim",
  },
  -- Java
  {
    "mfussenegger/nvim-jdtls"
  },
  -- Go
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    build = ":GoInstallDeps",
  },
  -- Rust
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "saecki/crates.nvim",
    tag = "stable",
    dependencies = "hrsh7th/nvim-cmp",
    event = { "BufRead Cargo.toml" },
    config = function()
      local crates = require("crates")
      crates.setup()

      vim.keymap.set("n", "<leader>rcu", function()
        crates.upgrade_all_crates()
      end)
    end
  },
  -- LaTeX
  {
    "lervag/vimtex",
    dependencies = "micangl/cmp-vimtex",
    ft = "tex",
    init = function()
      vim.g.vimtex_view_method = 'mupdf'
    end
  },
}

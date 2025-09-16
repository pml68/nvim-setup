local servers = {
  -- "asm_lsp",
  "html",
  "ts_ls",
  "cssls",
  "svelte",
  "bashls",
  "clangd",
  "pyright",
  "emmet_language_server",
  "jsonls",
  "rust_analyzer",
  "kotlin_lsp",
  "lua_ls",
  "glsl_analyzer",
  "csharp_ls",
  "gopls",
  "unocss",
}

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "build.sh", "*.subpackage.sh", "PKGBUILD", "*.install",
    "makepkg.conf", "*.ebuild", "*.eclass", "color.map", "make.conf" },
  callback = function()
    vim.lsp.start({
      name = "termux",
      cmd = { "termux-language-server" }
    })
  end,
})

vim.lsp.config('*', {
  -- capabilities = vim.tbl_deep_extend("force",
  --   vim.lsp.protocol.make_client_capabilities(),
  --   require('cmp_nvim_lsp').default_capabilities()),
  on_attach = function(client, bufnr)
    require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
  end
})

vim.lsp.enable(servers)

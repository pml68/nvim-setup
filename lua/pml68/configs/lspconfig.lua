local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

local servers = {
  -- "asm_lsp",
  "html",
  "tsserver",
  "cssls",
  "svelte",
  "bashls",
  "clangd",
  "pyright",
  "emmet_ls",
  "jsonls",
  "rust_analyzer",
  "kotlin_language_server",
  "lua_ls",
  "glsl_analyzer",
  "csharp_ls",
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

for _, server in pairs(servers) do
  local opts = {
    capabilities = capabilities,
  }

  local require_ok, conf_opts = pcall(require, "pml68.configs.settings." .. server)
  if require_ok then
    opts = vim.tbl_deep_extend("force", conf_opts, opts)
  end

  lspconfig[server].setup(opts)
end

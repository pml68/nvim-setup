vim.lsp.start({
  cmd = { "termux-language-server" },
  root_dir = vim.fn.getcwd(),
})

return {}

return {
  ensure_installed = {
    "bash-language-server",
    "lua-language-server",
    "clangd",
    "clang-format",
    "jq",
    "json-lsp",
    "svelte-language-server",
    "emmet-ls",
    "html-lsp",
    "css-lsp",
    "typescript-language-server",
    "pyright",
    "rust-analyzer",
    "glsl_analyzer",
    "elixir-ls",
    "kotlin-language-server"
  },
  PATH = "skip",
  ui = {
    icons = {
      package_pending = " ",
      package_installed = "󰄳 ",
      package_uninstalled = " 󰚌",
    },
    keymaps = {
      toggle_server_expand = "<CR>",
      install_server = "i",
      update_server = "u",
      check_server_version = "c",
      update_all_servers = "U",
      check_outdated_servers = "C",
      uninstall_server = "X",
      cancel_installation = "<C-c>",
    },
  },
  max_concurrent_installers = 10,
}

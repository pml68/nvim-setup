return {
  single_file_support = true,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = true,
        reportUnusedImport = true,
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
      },
    },
  },
}

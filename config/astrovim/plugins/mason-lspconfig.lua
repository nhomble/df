-- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
return {
  "williamboman/mason-lspconfig.nvim",
  opts = {
    automatic_installation = true,
    ensure_installed = {
      "terraformls",
      "lua_ls",
    }
  }
}

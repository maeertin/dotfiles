-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    -- Configure default capabilities for language servers (`:h vim.lsp.protocol.make_client.capabilities()`)
    capabilities = {
      textDocument = {
        foldingRange = {
          -- BUG: RPC[Error] code_name = InternalError, message = "Request textDocument/foldingRange failed ..."
          -- @see https://github.com/redhat-developer/yaml-language-server/issues/912
          dynamicRegistration = false,
          lineFoldingOnly = true,
        },
      },
    },
  },
}

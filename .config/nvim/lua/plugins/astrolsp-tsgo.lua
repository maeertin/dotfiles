-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  "AstroNvim/astrolsp",

  ---@param opts AstroLSPOpts
  opts = function(_, opts)
    -- Make sure the servers list exists
    opts.servers = opts.servers or {}

    -- Remove tsserver and vtsls from the servers list
    opts.servers = vim.tbl_filter(
      function(server) return server ~= "tsserver" and server ~= "ts_ls" and server ~= "vtsls" end,
      opts.servers
    )

    -- Register tsgo as a server AstroLSP should set up
    table.insert(opts.servers, "tsgo")

    -- Safely extend the config table
    opts.config = require("astrocore").extend_tbl(opts.config or {}, {
      tsgo = {
        -- Start the tsgo language server (intalled via nvm/npm)
        -- cmd = { "/Users/maeertin/.nvm/versions/node/v22.14.0/bin/tsgo", "--lsp", "--stdio" },
        -- Start the tsgo language server (intalled via :Mason)
        cmd = { "tsgo", "--lsp", "--stdio" },

        -- Which filetypes it should attach to
        filetypes = {
          "javascript",
          "javascriptreact",
          "javascript.jsx",
          "typescript",
          "typescriptreact",
          "typescript.tsx",
        },

        -- How to detect project root
        root_dir = require("lspconfig.util").root_pattern(
          "tsconfig.json",
          "jsconfig.json",
          "package.json",
          ".git",
          "tsconfig.base.json"
        ),

        -- You can put extra settings here later if tsgo adds any
        settings = {},
      },
    })
  end,
}

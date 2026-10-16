---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    config = {
      oxfmt = {
        workspace_required = true,
        root_dir = function(bufnr, on_dir)
          -- Opt in by project config, not by an installed executable or dependency.
          local root = vim.fs.root(bufnr, {
            ".oxfmtrc.json",
            ".oxfmtrc.jsonc",
            "oxfmt.config.ts",
            "oxfmt.config.mts",
          })
          if root then on_dir(root) end
        end,
      },
      tailwindcss = {
        settings = {
          tailwindCSS = {
            classFunctions = { "cva", "cn" },
          },
        },
      },
    },
  },
}

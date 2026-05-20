---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    config = {
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

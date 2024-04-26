-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  -- import/override with your plugins folder

  -- Colorscheme
  { import = "astrocommunity.colorscheme.nightfox-nvim" },

  -- Autocompletion
  { import = "astrocommunity.completion.copilot-lua-cmp" },

  -- Additional powerful text objects
  { import = "astrocommunity.motion.mini-ai" },

  -- Vim match-up: even better `%`
  { import = "astrocommunity.motion.vim-matchup" },

  -- Splitting/joining blocks of code
  { import = "astrocommunity.editing-support.treesj" },

  -- Editor rulers
  { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" },
  {
    "m4xshen/smartcolumn.nvim",
    opts = {
      colorcolumn = { 80, 100 },
      disabled_filetypes = { "help" },
    },
  },
}

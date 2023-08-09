return {
  -- Git commands inside vim
  { "tpope/vim-fugitive", lazy = false },
  { "tpope/vim-rhubarb", event = "User AstroGitFile" },

  -- Delete/change/add parentheses/quotes/XML-tags/much more with ease
  { "tpope/vim-surround", event = "User AstroFile" },

  -- Smooth scrolling
  {
    "karb94/neoscroll.nvim",
    event = "User AstroFile",
    opts = {},
  },

  -- Highlight, list and search todo comments in your projects
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "User AstroFile",
    cmd = { "TodoQuickFix" },
    keys = {
      { "<leader>T", "<cmd>TodoTelescope<cr>", desc = "Open TODOs in Telescope" },
    },
    opts = {},
  },
}

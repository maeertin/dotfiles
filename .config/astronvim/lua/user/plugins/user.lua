return {
  -- Git commands inside vim
  { "tpope/vim-fugitive", lazy = false },
  { "tpope/vim-rhubarb",  event = "User AstroGitFile" },

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

  -- Navigate your code with search labels
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    vscode = true,
    opts = {},
    keys = {
      {
        "<leader>s",
        mode = { "n", "x", "o" },
        function() require("flash").jump() end,
        desc = "Flash",
      },
      {
        "<leader>S",
        mode = { "n", "o", "x" },
        function() require("flash").treesitter() end,
        desc = "Flash Treesitter",
      },
    },
  },

  -- Nvim lua plugin which adds support for twoslash queries into typescript projects
  {
    "marilari88/twoslash-queries.nvim",
    event = "User AstroFile",
    config = function()
      require("lspconfig")["tsserver"].setup {
        on_attach = function(client, bufnr) require("twoslash-queries").attach(client, bufnr) end,
      }
    end,
  },
}

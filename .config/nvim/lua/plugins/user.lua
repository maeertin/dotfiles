-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
  -- Neovim plugin to manage the file system and other tree like structures
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      -- Add custom neo-tree keybindings
      vim.keymap.set("n", "<Leader>fe", "<cmd>Neotree reveal<cr>", { silent = true })

      -- Override default neo-tree options
      opts.filesystem.filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = true,
      }
      opts.filesystem.follow_current_file.enabled = false
      opts.window.width = 40
      opts.sources = {
        "filesystem",
        -- "buffers",
        -- "git_status",
        -- "document_symbols",
      }
      return opts
    end,
  },

  -- Snippet Engine for Neovim
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call

      -- Load my custom VS Code snippets
      require("luasnip.loaders.from_vscode").lazy_load { paths = { "~/.config/nvim/lua/snippets" } }

      -- Remap `expand_or_jump` to "<C-e>" as it clashes with copilot suggestions
      local luasnip = require "luasnip"
      vim.keymap.set({ "i", "s" }, "<C-e>", function()
        if luasnip.expand_or_jumpable() then luasnip.expand_or_jump() end
      end, { silent = true })
    end,
  },

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
  -- {
  --   "folke/flash.nvim",
  --   event = "VeryLazy",
  --   vscode = true,
  --   opts = {},
  --   keys = {
  --     {
  --       "<leader>s",
  --       mode = { "n", "x", "o" },
  --       function() require("flash").jump() end,
  --       desc = "Flash",
  --     },
  --     {
  --       "<leader>S",
  --       mode = { "n", "o", "x" },
  --       function() require("flash").treesitter() end,
  --       desc = "Flash Treesitter",
  --     },
  --   },
  -- },
}

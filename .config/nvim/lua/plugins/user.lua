-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- PLEASE REMOVE THE EXAMPLES YOU HAVE NO INTEREST IN BEFORE ENABLING THIS FILE
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

  -- You can disable default plugins as follows:
  -- { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      -- include the default astronvim config that calls the setup call
      require "astronvim.plugins.configs.luasnip"(plugin, opts)

      -- Load my custom VS Code snippets
      require("luasnip.loaders.from_vscode").lazy_load { paths = { "~/.config/nvim/lua/snippets" } }

      -- Remap `expand_or_jump` to "<C-e>" as it clashes with copilot suggestions
      -- local luasnip = require "luasnip"
      -- vim.keymap.set({ "i", "s" }, "<C-e>", function()
      --   if luasnip.expand_or_jumpable() then luasnip.expand_or_jump() end
      -- end, { silent = true })

      -- add more custom luasnip configuration such as filetype extend or custom snippets
      -- local luasnip = require "luasnip"
      -- luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  -- {
  --   "windwp/nvim-autopairs",
  --   config = function(plugin, opts)
  --     require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom autopairs configuration such as custom rules
  --     local npairs = require "nvim-autopairs"
  --     local Rule = require "nvim-autopairs.rule"
  --     local cond = require "nvim-autopairs.conds"
  --     npairs.add_rules(
  --       {
  --         Rule("$", "$", { "tex", "latex" })
  --           -- don't add a pair if the next character is %
  --           :with_pair(cond.not_after_regex "%%")
  --           -- don't add a pair if  the previous character is xxx
  --           :with_pair(
  --             cond.not_before_regex("xxx", 3)
  --           )
  --           -- don't move right when repeat character
  --           :with_move(cond.none())
  --           -- don't delete if the next character is xx
  --           :with_del(cond.not_after_regex "xx")
  --           -- disable adding a newline when you press <cr>
  --           :with_cr(cond.none()),
  --       },
  --       -- disable for .vim files, but it work for another filetypes
  --       Rule("a", "a", "-vim")
  --     )
  --   end,
  -- },

  -- Delete/change/add parentheses/quotes/XML-tags/much more with ease
  { "tpope/vim-surround", event = "User AstroFile" },

  -- Smooth scrolling
  {
    "karb94/neoscroll.nvim",
    event = "User AstroFile",
    opts = {},
  },
}

-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

    -- keep cursor centered
    -- ["<C-d>"] = { "<C-d>zz", desc = "Scroll down and center cursor" },
    -- ["<C-u>"] = { "<C-u>zz", desc = "Scroll down and center cursor" },
    -- navigate buffers
    ["<S-h>"] = { ":bprevious<CR>", desc = "Navigate to previous buffer" },
    ["<S-l>"] = { ":bnext<CR>", desc = "Navigate to next buffer" },
  },
  v = {
    -- stay in indent mode
    ["<"] = { "<gv", desc = "Indent left and keep selection" },
    [">"] = { ">gv", desc = "Indent right and keep selection" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}

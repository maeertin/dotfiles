-- Customize None-ls sources

local function with_oxfmt_fallback(source)
  local runtime_condition = source._opts and source._opts.runtime_condition
  return source.with {
    runtime_condition = function(params)
      if #vim.lsp.get_clients({ bufnr = params.bufnr, name = "oxfmt" }) > 0 then return false end
      if runtime_condition then return runtime_condition(params) end
      return true
    end,
  }
end

local function register_prettier(source_name, methods)
  local null_ls = require "null-ls"
  if null_ls.is_registered(source_name) then return end
  for _, method in ipairs(methods) do
    null_ls.register(with_oxfmt_fallback(null_ls.builtins[method][source_name]))
  end
end

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    {
      "jay-babu/mason-null-ls.nvim",
      opts = {
        handlers = {
          -- Installed Mason tools are registered separately from opts.sources.
          prettier = register_prettier,
          prettierd = register_prettier,
        },
      },
    },
  },
  opts = function(_, opts)
    -- Apply the same fallback to explicitly configured sources.
    for index, source in ipairs(opts.sources or {}) do
      if source.name == "prettier" or source.name == "prettierd" then
        opts.sources[index] = with_oxfmt_fallback(source)
      end
    end
  end,
}

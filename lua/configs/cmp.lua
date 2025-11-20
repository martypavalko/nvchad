dofile(vim.g.base46_cache .. "cmp")

local cmp = require "cmp"

-- Load NvChad's default config first
local default_opts = require "nvchad.configs.cmp"

-- Override just the sorting
default_opts.sorting = {
  comparators = {
    cmp.config.compare.offset,
    cmp.config.compare.exact,
    cmp.config.compare.score,
    cmp.config.compare.recently_used,
    cmp.config.compare.locality,
    -- Deprioritize snippets so text completions appear first
    function(entry1, entry2)
      local kind1 = entry1:get_kind()
      local kind2 = entry2:get_kind()
      local types = require('cmp.types').lsp.CompletionItemKind
      if kind1 == types.Snippet and kind2 ~= types.Snippet then
        return false
      elseif kind1 ~= types.Snippet and kind2 == types.Snippet then
        return true
      end
    end,
    cmp.config.compare.kind,
    cmp.config.compare.sort_text,
    cmp.config.compare.length,
    cmp.config.compare.order,
  },
}

return default_opts

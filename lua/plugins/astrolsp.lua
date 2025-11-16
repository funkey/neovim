---@type LazySpec
return {
  "AstroNvim/astrolsp",
  -- ---@param opts AstroLSPOpts
  -- opts = function(plugin, opts)
  --   opts.servers = opts.servers or {}
  --   table.insert(opts.servers, "uv_pyright")
  --   opts.config = require("astrocore").extend_tbl(opts.config or {}, {
  --     uv_pyright = {
  --       cmd = { "uv", "run", "pyright-langserver", "--stdio" },
  --       filetypes = { "python" },
  --     },
  --   })
  -- end,
  ---@type AstroLSPOpts
  opts = {
    -- Configuration table of features provided by AstroLSP
    features = {
      codelens = true, -- enable/disable codelens refresh on start
      inlay_hints = false, -- enable/disable inlay hints on start
      semantic_tokens = true, -- enable/disable semantic token highlighting
    },
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
      },
    },
    -- customize language server configuration options passed to `lspconfig`
    ---@diagnostic disable: missing-fields
    config = {
      ruff = { settings = { lineLength = 100 } },
      pyright = {
        cmd = { "uv", "run", "--with", "pyright", "pyright-langserver", "--stdio" },
      },
    },
  },
}

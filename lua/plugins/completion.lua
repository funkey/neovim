return {
  "saghen/blink.cmp",
  -- disable completion for markdown files
  enabled = function() return not vim.tbl_contains({ "markdown" }, vim.bo.filetype) end,
  -- enabled = false,
  opts = {
    -- don't use for the command line
    cmdline = { enabled = false },
    signature = { enabled = true },
    completion = {
      trigger = {
        show_on_trigger_character = true,
        show_on_insert_on_trigger_character = true,
      },
      -- match complete word
      keyword = { range = "full" },
      -- disable auto brackets
      accept = { auto_brackets = { enabled = false } },
      -- on trigger, select first entry but do not insert until accepted
      list = { selection = { preselect = true, auto_insert = false } },
      -- don't show the completion menu automatically
      menu = { auto_show = false },
      -- show documentation when selecting an item
      documentation = { auto_show = true },
      -- no ghost text, this is distracting
      ghost_text = { enabled = false },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
  },
}

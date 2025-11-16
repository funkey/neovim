return {
  "saghen/blink.cmp",
  opts = {
    signature = { enabled = true },
    keymap = { preset = "enter" },
    completion = {
      trigger = { show_on_trigger_character = true, show_on_insert_on_trigger_character = true },
      keyword = { range = "full" },
      accept = { auto_brackets = { enabled = false } },
      list = { selection = { preselect = true, auto_insert = false } },
      menu = { auto_show = false },
      documentation = { auto_show = true },
      ghost_text = { enabled = false },
    },
  },
}

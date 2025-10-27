return {
  "greggh/claude-code.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required for git operations
  },
  enabled = false,
  config = function()
    require("claude-code").setup()
  end
}

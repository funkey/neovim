return {
  "funkey/funkey.nvim",
  opts = {
      -- custom options here
  },
  config = function(_, opts)
      require("funkey").setup(opts) -- calling setup is optional
      vim.cmd [[colorscheme funkey]]
  end,
}

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = false,
        wrap = true,
      },
    },
  },
}

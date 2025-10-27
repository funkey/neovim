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
    mappings = {
      n = {
        ["<Tab>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["<S-Tab>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
        [";;"] = ":%s///g<Left><Left><Left>",
        -- workaround for neo-tree and buffer close (without it, it will close nvim if neo-tree is open)
        ["<Leader>c"] = ":bn | bd #<Enter>",
      },
      v = {
        [";;"] = ":s///g<Left><Left><Left>",
      }
    },
  },
}

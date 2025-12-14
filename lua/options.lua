local opt = vim.opt
opt.signcolumn = "yes:1" -- Always show sign column
opt.termguicolors = true -- Enable true colors
opt.ignorecase = false -- Don't ignore case in search
opt.autoindent = true -- Enable auto indentation
opt.expandtab = true -- Use spaces instead of tabs
opt.tabstop = 4 -- Number of spaces for a tab
opt.softtabstop = 4 -- Number of spaces for a tab when editing
opt.shiftwidth = 4 -- Number of spaces for autoindent
opt.shiftround = true -- Round indent to multiple of shiftwidth
opt.listchars = "tab: ,multispace:·   " -- Characters to show for tabs and spaces
opt.list = true -- Show whitespace characters
opt.number = true -- Show line numbers
opt.relativenumber = false -- Show absolute line numbers
opt.wrap = true -- Enable line wrapping
opt.cursorline = false -- Don't highlight the current line
opt.scrolloff = 8 -- Keep 8 lines above and below the cursor
opt.inccommand = "nosplit" -- Shows the effects of a command incrementally in the buffer
opt.undofile = true -- Enable persistent undo
opt.completeopt = { "menuone", "popup", "noinsert" } -- Options for completion menu
opt.winborder = "rounded" -- Use rounded borders for windows
opt.hlsearch = true -- Enable highlighting of search results
opt.clipboard = "unnamedplus" -- Use system clipboard
opt.cmdheight = 0 -- Hide command line when not in use

vim.cmd.filetype("plugin indent on") -- Enable filetype detection, plugins, and indentation
vim.cmd.colorscheme("funkey")

-- disable deprecation warnings
vim.deprecate = function() end

-- autoformat python files
vim.api.nvim_create_autocmd(
    {"BufWritePre"},
    {
        pattern = { "*.py" },
        callback = function(_)
            vim.lsp.buf.format()
        end
    }
)

-- prettier diagnostic signs
local icons = require("icons")
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = icons.error,
      [vim.diagnostic.severity.WARN] = icons.warn,
      [vim.diagnostic.severity.INFO] = icons.info,
      [vim.diagnostic.severity.HINT] = icons.hint,
    },
  }
})

-- thicker split lines
opt.fillchars = {
  horiz = '━',
  horizup = '┻',
  horizdown = '┳',
  vert = '┃',
  vertleft  = '┫',
  vertright = '┣',
  verthoriz = '╋',
}

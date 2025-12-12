local icons = require("icons")

--- lsp-config
vim.pack.add({
    { src = "https://github.com/neovim/nvim-lspconfig" },
})

--- mason
vim.pack.add({
	{ src = "https://github.com/mason-org/mason.nvim" },
})
require("mason").setup({})

--- blink.cmp
vim.pack.add({
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
})
require("blink.cmp").setup({
    cmdline = { enabled = false },
    signature = { enabled = true },
	keymap = {
		preset = "none",
		["<C-n>"] = { "show", "select_next", "fallback" },
		["<C-p>"] = { "show", "select_prev", "fallback" },
		["<Tab>"] = { "select_next", "fallback" },
		["<S-Tab>"] = { "select_prev", "fallback" },
		["<CR>"] = { "accept", "fallback" },
		["<C-k>"] = { "show_signature" },
		["<C-e>"] = { "hide_signature" },
	},
    completion = {
      -- don't show the completion menu automatically
      menu = { auto_show = false },
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
      -- show documentation when selecting an item
      documentation = { auto_show = true },
      -- no ghost text, this is distracting
      ghost_text = { enabled = false },
    },
	fuzzy = {
		sorts = {
			"exact",
			"score",
			"sort_text",
		},
	},
    sources = {
      default = { "lsp", "path", "buffer" },
    },
})

--- gitsigns
vim.pack.add({
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
})
require("gitsigns").setup({})

--- funkey theme
vim.pack.add({
	{ src = "https://github.com/funkey/funkey.nvim" },
})
require("funkey").setup({})
local palette = require("funkey.palette")

--- neo tree
vim.pack.add({
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
})
vim.pack.add({
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
})
vim.pack.add({
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
})
vim.pack.add({
	{ src = "https://github.com/nvim-neo-tree/neo-tree.nvim" },
})
require("neo-tree").setup({
    default_component_configs = {
        modified = { symbol = icons.unsaved },
        git_status = {
          symbols = {
            added     = icons.added,
            deleted   = icons.removed,
            modified  = icons.modified,
            renamed   = icons.moved,
            untracked = icons.new,
            ignored   = icons.ignored,
            unstaged  = "",
            staged    = "",
            conflict  = icons.conflict,
          },

          align = "right",
        },
      },
})

--- bufferline
vim.pack.add({
	{ src = "https://github.com/akinsho/bufferline.nvim" },
})
local bufferline = require("bufferline")
bufferline.setup({
    options = {
        style_preset = bufferline.style_preset.no_italic,
        indicator = { style = "none" },
        offsets = {
            {
                filetype = "neo-tree",
                text = "Files",
                highlight = "TabLineFill",
                text_align = "center",
                separator = false,
                padding = 1,
            }
        },
        separator_style = "slant",
        modified_icon = icons.unsaved,
    },
    highlights = {
        fill = {
            bg = palette.background_1,
        },
        background = {
            bg = palette.background_1,
        },
        -- set bg for not selected elements
        close_button = { bg = palette.background_1, },
        numbers = { bg = palette.background_1, },
        diagnostic = { bg = palette.background_1, },
        hint = { bg = palette.background_1, },
        hint_diagnostic = { bg = palette.background_1, },
        info = { bg = palette.background_1, },
        info_diagnostic = { bg = palette.background_1, },
        warning = { bg = palette.background_1, },
        warning_diagnostic = { bg = palette.background_1, },
        error = { bg = palette.background_1, },
        error_diagnostic = { bg = palette.background_1, },
        modified = { bg = palette.background_1, },
        duplicate = { bg = palette.background_1, },
        -- not selected separators should be invisible
        separator = {
            fg = palette.background_1,
            bg = palette.background_1,
        },
        separator_selected = {
            -- fg is actually the background color here
            fg = palette.background_1,
        },
        separator_visible = {
            -- fg is actually the background color here
            fg = palette.background_1,
        },
    },
})

--- bufdelete
vim.pack.add({
	{ src = "https://github.com/famiu/bufdelete.nvim" },
})

--- lualine
vim.pack.add({
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
})
require("lualine").setup({
	options = {
        icons_enabled = true,
		globalstatus = true,
        component_separators = "",
        section_separators = "",
        theme = {
            normal = {
                a = { bg = palette.background_1 },
                b = { bg = palette.background_1 },
                c = { bg = palette.background_1 },
            },
        },
	},
    sections = {
        lualine_a = {
            { "branch", icon = icons.branch },
        },
        lualine_b = {
            {
                "diff",
                symbols = {
                    added = icons.added .. " ",
                    modified = icons.modified .. " ",
                    removed = icons.removed .. " " },
            }
        },
        lualine_c = {
            {
                "diagnostics",
                sources = { "nvim_diagnostic" },
                symbols = {
                    error = icons.error .. " ",
                    warn = icons.warn .. " ",
                    info = icons.info .. " ",
                    hint = icons.hint .. " "
                },
            },
        },
        lualine_x = {
            {
                "lsp_status",
                icon = icons.settings,
                symbols = {
                    spinner = icons.spinner,
                    done = " ",
                    separator = " ",
                },
                ignore_lsp = {},
                show_name = true,
            },
            "location"
        },
        lualine_y = {"encoding"},
        lualine_z = {"filetype"},
    },
})

--- noice
vim.pack.add({
    { src = "https://github.com/MunifTanjim/nui.nvim" },
})
vim.pack.add({
    { src = "https://github.com/rcarriga/nvim-notify" },
})
vim.pack.add({
    { src = "https://github.com/folke/noice.nvim" },
})
require("noice").setup({})

--- markdown plus
vim.pack.add({
	{ src = "https://github.com/YousefHadder/markdown-plus.nvim" },
})

--- guess indent
vim.pack.add({
    { src = "https://github.com/NMAC427/guess-indent.nvim" },
})
require("guess-indent").setup({})

--- whichkey
vim.pack.add({
    { src = "https://github.com/folke/which-key.nvim" },
})
require("which-key").setup({ icons = { group = "" } })

--- treesitter
vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})
require("nvim-treesitter").setup()
require("nvim-treesitter.configs").setup({
    ensure_installed = { "c", "lua", "markdown", "python", "latex" },
    sync_install = true,
    auto_install = true,
    highlight = { enable = true },
})

--- telescope
vim.pack.add({
    { src = "https://github.com/nvim-telescope/telescope.nvim" },
})
require("telescope").setup({})

--- remember (last cursor position)
vim.pack.add({
    { src = "https://github.com/vladdoster/remember.nvim" },
})
require("remember").setup({})

--- lazygit
vim.pack.add({
	{ src = "https://github.com/kdheepak/lazygit.nvim" },
})

--- comments
vim.pack.add({
	{ src = "https://github.com/numToStr/Comment.nvim" },
})
require("Comment").setup()

--- lazydev (for easier neovim config editing)
vim.pack.add({
    { src = "https://github.com/folke/lazydev.nvim" },
})
require("lazydev").setup({})

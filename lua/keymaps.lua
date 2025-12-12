local keymap = vim.keymap.set

-- set the leader to <space>
vim.g.mapleader = " "
keymap("n", "<space>", "<Nop>")

-- open file explorer
keymap("n", "<Leader>e", "<Cmd>Neotree<CR>")

-- move between buffers
keymap("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>")
keymap("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>")

-- close buffer
keymap("n", "<Leader>c", "<Cmd>Bdelete<CR>")

-- move in soft-wrapped lines
keymap("n", "k", function() return vim.v.count == 0 and "gk" or "k" end, { expr = true })
keymap("n", "j", function() return vim.v.count == 0 and "gj" or "j" end, { expr = true })

-- move between windows
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-- search and replace shortcuts
keymap("n", ";;", ":%s///g<Left><Left><Left>")
keymap("v", ";;", ":s///g<Left><Left><Left>")

-- telescope
local ts = require("telescope.builtin")
keymap("n", "<Leader>ff", ts.find_files, { desc = "Find file" })
keymap("n", "<Leader>fw", ts.live_grep, { desc = "Find word" })
keymap("n", "<Leader>fb", ts.buffers, { desc = "Find buffer" })
keymap("n", "<Leader>fh", ts.help_tags, { desc = "Find help" })
keymap("n", "<Leader>fd", ts.diagnostics, { desc = "Find diagnostics" })
keymap("n", "<Leader>fn", function () require("telescope").extensions.notify.notify() end, { desc = "Find notifications" })
-- lazy git
keymap("n", "<Leader>gg", "<cmd>LazyGit<CR>", { desc = "LazyGit" })

-- comments
keymap("n", "<Leader>/", "gcc", { remap = true, desc = "Toggle comment"})
keymap("v", "<Leader>/", "gc", { remap = true, desc = "Toggle comment" })

-- code actions
keymap("n", "<Leader>l", "", { desc = "Language Tools" })
keymap("v", "<Leader>l", "", { desc = "Language Tools" })
keymap("n", "<Leader>la",  function() vim.lsp.buf.code_action() end, { desc = "LSP code action" })
keymap("n", "<Leader>lA",  function() vim.lsp.buf.code_action({ context = { only = { "source" }, diagnostics = {} } }) end, { desc = "LSP source action" })
keymap("n", "gD", function() vim.lsp.buf.declaration() end, { desc = "Declaration of current symbol" })
keymap("n", "gd", function() vim.lsp.buf.definition() end, { desc = "Definition of current symbol" })

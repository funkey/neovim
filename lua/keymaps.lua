local keymap = vim.keymap.set

-- set the leader to <space>
vim.g.mapleader = " "
keymap("n", "<space>", "<Nop>")

-- move between buffers
keymap("n", "<C-I>", "<C-I>", { noremap = true }) -- that is somehow needed when we map <Tab>
keymap("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>")
keymap("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>")

-- move in soft-wrapped lines
keymap({"n", "v"}, "k", function() return vim.v.count == 0 and "gk" or "k" end, { expr = true })
keymap({"n", "v"}, "j", function() return vim.v.count == 0 and "gj" or "j" end, { expr = true })

-- move between windows
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-- search and replace shortcuts
keymap("n", ";;", ":%s///g<Left><Left><Left>")
keymap("v", ";;", ":s///g<Left><Left><Left>")

----------------------
--- Go To Commands ---
----------------------

keymap("n", "gD", function() vim.lsp.buf.declaration() end, { desc = "Declaration of current symbol" })
keymap("n", "gd", function() vim.lsp.buf.definition() end, { desc = "Definition of current symbol" })

-----------------------
--- Leader Commands ---
-----------------------

-- comments
keymap("n", "<Leader>/", "gcc", { remap = true, desc = "Toggle comment"})
keymap("v", "<Leader>/", "gc", { remap = true, desc = "Toggle comment" })

-- open file explorer
keymap("n", "<Leader>e", "<Cmd>Neotree<CR>", { desc = "Open file explorer" })

-- close buffer
keymap("n", "<Leader>c", "<Cmd>Bdelete<CR>", { desc = "Close buffer" })

----------------------------
-- group "f": find things --
----------------------------

keymap({"n", "v"}, "<Leader>f", "<Nop>", { desc = "Find" })
local ts = require("telescope.builtin")
keymap("n", "<Leader>ff", ts.find_files, { desc = "Find file" })
keymap("n", "<Leader>fw", ts.live_grep, { desc = "Find word" })
keymap("n", "<Leader>fb", ts.buffers, { desc = "Find buffer" })
keymap("n", "<Leader>fh", ts.help_tags, { desc = "Find help" })
keymap("n", "<Leader>fd", ts.diagnostics, { desc = "Find diagnostics" })
keymap("n", "<Leader>fn", function () require("telescope").extensions.notify.notify() end, { desc = "Find notifications" })

---------------------------------
-- group "l": language actions --
---------------------------------

keymap({"n", "v"}, "<Leader>l", "<Nop>", { desc = "Code" })
keymap("n", "<Leader>la",  "<cmd>Lspsaga code_action<CR>", { desc = "LSP code action" })
keymap("n", "<Leader>lA",  function() vim.lsp.buf.code_action({ context = { only = { "source" }, diagnostics = {} } }) end, { desc = "LSP source action" })
keymap("n", "<Leader>lf",  function() vim.lsp.buf.references() end, { desc = "Find references" })
keymap("n", "<Leader>lr",  function() vim.lsp.buf.rename() end, { desc = "Rename" })

----------------------------
-- group "g": git actions --
----------------------------

keymap({"n", "v"}, "<Leader>g", "<Nop>", { desc = "Git" })
keymap("n", "<Leader>gg", "<cmd>LazyGit<CR>", { desc = "LazyGit" })
local gs = require("gitsigns")
keymap("n", "<Leader>gb", gs.blame, { desc = "Blame" })

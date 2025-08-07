-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness
local opts = { noremap = true, silent = true }

-- clear search highlights
keymap.set("n", "<leader>cl", ":nohl<CR>", { desc = "Clear search highlights" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", opts)         -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", opts)         -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", opts)         -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", opts) -- close current split window

-- delete single character without copying into register
keymap.set("n", "x", '"_x', opts)

-- Vertical scroll and center
keymap.set("n", "<C-d>", "<C-d>zz", opts)
keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- Find and center
keymap.set("n", "n", "nzzzv", opts)
keymap.set("n", "N", "Nzzzv", opts)

-- Stay in indent mode
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

-- Keep last yanked when pasting
keymap.set("v", "p", '"_dP', opts)

keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
keymap.set('n', '<leader>w', ':write<CR>')
keymap.set('n', '<leader>q', ':quitall<CR>')

keymap.set('n', '<leader>e', ":Oil --float<CR>")
keymap.set('n', '<leader>sf', ":Pick files<CR>")
keymap.set('n', '<leader>sg', ":Pick live_grep<CR>")
keymap.set('n', '<leader>sh', ":Pick help<CR>")

keymap.set('n', '<leader>lf', vim.lsp.buf.format)

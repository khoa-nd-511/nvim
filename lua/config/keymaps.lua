-- set leader key to space
vim.g.mapleader = ' '

local map = vim.keymap.set -- for conciseness
local opts = { noremap = true, silent = true }

-- clear search highlights
map('n', '<leader>cl', ':nohl<CR>', opts)

-- window management
map('n', '<leader>sv', '<C-w>v', opts)         -- split window vertically
map('n', '<leader>sh', '<C-w>s', opts)         -- split window horizontally
map('n', '<leader>se', '<C-w>=', opts)         -- make split windows equal width & height
map('n', '<leader>sx', '<cmd>close<CR>', opts) -- close current split window

-- delete single character without copying into register
map('n', 'x', '"_x', opts)

-- Vertical scroll and center
-- map("n", "<C-d>", "<C-d>zz", opts)
-- map("n", "<C-u>", "<C-u>zz", opts)

-- Find and center
map('n', 'n', 'nzzzv', opts)
map('n', 'N', 'Nzzzv', opts)

-- Stay in indent mode
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

-- Keep last yanked when pasting
map('v', 'p', '"_dP', opts)

map('n', '<leader>o', ':update<CR> :source<CR>')
map('n', '<leader>w', function()
  vim.lsp.buf.format()
  vim.cmd('write')
end)
map('n', '<leader>q', ':quitall<CR>')
map('n', '<leader>b', ':e #<CR>')

map('n', '<C-n>', ':Oil --float<CR>')
map('n', '<leader>sf', ':Pick files<CR>')
map('n', '<leader>sg', ':Pick live_grep<CR>')
map('n', '<leader>sh', ':Pick help<CR>')

-- native lsp commands
map('n', '<leader>f', vim.lsp.buf.format)
map('n', '<leader>rn', vim.lsp.buf.rename)
map('n', '<leader>ca', vim.lsp.buf.code_action)
map('n', 'gd', vim.lsp.buf.definition)
map('n', 'gr', vim.lsp.buf.references)

-- move line(s)
map('n', '<A-j>', ':m.+1<CR>==', opts)
map('v', '<A-j>', ":m'>+1<CR>gv", opts)
map('n', '<A-k>', ':m.-2<CR>==', opts)
map('v', '<A-k>', ":m'<-2<CR>gv", opts)

-- map("n", "<leader>lg", ":LazyGit<CR>")

-- tmux
map('n', '<C-h>', 'TmuxNavigateLeft<CR>', opts)
map('n', '<C-j>', 'TmuxNavigateDown<CR>', opts)
map('n', '<C-k>', 'TmuxNavigateUp<CR>', opts)
map('n', '<C-l>', 'TmuxNavigateRight<CR>', opts)
map('n', '<C-\\>', 'TmuxNavigatePrevious<CR>', opts)


map('n', '<leader>lg', ':LazyGit<CR>', opts)

map('n', 'H', '<cmd>BufferLineCyclePrev<CR>')
map('n', 'L', '<cmd>BufferLineCycleNext<CR>')
map('n', '<leader>bw', '<cmd>BufferLineCloseOthers<CR>')
